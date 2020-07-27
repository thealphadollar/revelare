---
title: How I Handled 1 TB of Data With Python!
layout: post
section-type: post
featured_img: img/posts/aws-1tb/bigdata.jpg
category: learning
tags:
- bigdata
- aws
- experience
- coding
- data analytics
- guide
- lessons
- programming
- python
- tech
- tutorial
---

I recently had the opportunity to work on a large dataset (roughly **1TB**) and analyze it using Python for filtering data based on some given parameters. In this post, I'll be summing up how I accomplished the task using Python and used various measures to make the filtering process efficient.

### Task Details

![Python AWS]({{"img/posts/aws-1tb/python-aws.jpeg" | absolute_url}})

We have a large number of gzip files inside folders in the root folder in a AWS S3 bucket and we have a EC2 instance which has been [given IAM role to access the bucket](https://www.youtube.com/watch?v=NHAuCWIHevk) in read-write mode. Each of the compressed file contains a JSON file which has a Python dictionary in each of it's line. Note that this is **not** our typical JSON file which we can load entirely; **each of the line represents a Python object** (dictionary here) but the entire file doesn't represent an object. Refer below for better understanding.

```JSON
{'key1': 'value1', 'key2': 2}
{'key1': 'value2', 'key2': 3}

```

An important aspect is that each of the compressed file is around 1 GB and after decompressing it gives us a file of size more than 4 GB. For starters, we have an EC2 instance with just 2GB of memory and hence we can't be loading the entire file at once into the program lest we want to face memory issues.

The output of filtering should be a CSV file with matching entries based on a filter. The caveat here is that we **do not** know about the number of entries that may match our filter and hence we can neither store this file in the memory nor directly write it to the disk since we have an instance with just 8GB of disk storage.

So, let's move on and see how we can solve the problems we have here.

#### Attaching S3 as File System

The first step we should do which will ease a lot of stuff for us is attaching the S3 bucket as a file system in our EC2 instance. This is very easy if we are trying to access the bucket from an instance of EC2 which has been granted the IAM role for the bucket you are trying to access. A great python package available for the same is [s3fs](https://pypi.org/project/s3fs/).

```python
import s3fs

fs = s3fs.S3FileSystem(anon=False)
# opening an example file
with fs.open("bucket/file.gz") as f_gz:
	pass

```

`anon` is False since we will be authenticating based on the IAM role attached to the EC2 instance.

With the successful attachment of the bucket, we can use it just like our own file system. So, on an abstration level we can say that it is like mounting an external hard drive. Also, since S3 is being accessed by EC2 the speeds are pretty incredible and the bottleneck is minimal.

#### Handling Data Output

![S3FS]({{"img/posts/aws-1tb/sf3s.png" | absolute_url}})

As we noted earlier, we are not sure about the size of the filtered data that our program will output and hence we cannot keep the same on our hard drive storage (i.e. 8GB). For this, we need to use the attached S3 and create a file in which we would be writing as each of the line is spewed out by our program. 

```python
import csv

with fs.open('bucket/output.csv') as f_csv:
	writer = csv.DictWriter(f_csv, fieldnames=output_object.keys())
	# write header
	writer.writeheader()
	while(True):
		# --- logic to read line by line simplified
		line = process_input()
		writer.writerow(line)
		...

```

The above code has two points which are important; firstly, we **open the file only once** and do all the work and at the end we come out of the scope of `with`, closing the file. This helps us avoid the [extra time that it'll take us to open and close the file each time](https://stackoverflow.com/questions/11349020/python-file-open-close-every-time-vs-keeping-it-open-until-the-process-is-finish) we are writing to it (remember we are talking about potentially millions of lines). It is important to notice that this doesn't mean that the writings are kept in the memory and then passed on when we close it. The writing is happening as we produce each line, just that the file object is kept alive all of that time.

Second important point is that since this is a CSV file, we need to have the same structure for all the objects we will be trying to write into this file. For the same purpose we will be using a dictionary `output_object`. We will be keeping this as a OrderedDict in order to avoid reordering of the keys in each new instance of the object. Whenever creating a new output object, we will be using python [DeepCopy](https://www.geeksforgeeks.org/copy-python-deep-copy-shallow-copy/).


```python
from copy import deepcopy

new_output = deepcopy(output_object)

```

The alternate could  be shallow copy (`copy` instead of `deepcopy`) if the object just has single level of depth.

#### Handling Data Input

Data of 1TB is not easy to handle, and we will be implementing a few measures to make sure we do not run out of memory while handling the data as well as making sure the process is efficient enough. Firstly, let's talk about how are we going to load the data: we will be listing each of the folder in the root folder and then iteratively downloading one file at a time to our system (we will see how this is better than simply using `s3fs` in a while).

```python
all_folders_in_root = fs.ls(ROOT_FOLDER)
for folder in all_folders_in_root:
	files = fs.ls(folder)
	for file_path in files:
		fs.get(file_path, 'data.gz')
		# work with file here
		...
		# work done
		os.remove('data.gz')

```

This makes sure that we are not downloading all the files and storing them which would have led us to run out of disk space. Next comes another crucial step; remember that these files are gzip compressed files and so you might think that we need to decompress them before reading the JSON file line by line. NO, we can read it with `gzip` python package as normal files without decompression. This is the reason we had to download the entire file instead of reading it using `s3fs` since this method will only work on files on the disk.

```python
all_folders_in_root = fs.ls(ROOT_FOLDER)
for folder in all_folders_in_root:
	files = fs.ls(folder)
	for file_path in files:
		fs.get(file_path, 'data.gz')
		# work with file here
		with gzip.open('data.gz', 'rt') as f_gz:
			for line in fgz:
				process_line(line, csv, csv_f)
		# work done
		os.remove('data.gz')

```

'rt' implies that we are reading the file in text mode. A list of all acceptable modes is available [here](https://www.reddit.com/r/learnpython/comments/88h4yz/what_do_the_gzipopen_modes_mean/). This way we are able to read it just like if we had the file uncompressed and since we are still reading it line by line, the entire file is not loaded into the memory and we do not have to deal with file size problems and low memory issues.

##### Handling Filtering

This is a subset of how we are going to handle the data input and deals with good practices for comparison in order to reduce time complexity of operations since we will be doing the same operations over and over on thousands of millions of lines. Firstly, we will be using [`ujson`](https://pypi.org/project/ujson/) package which uses Cython at the backside in order to provide [speed improvements of four times overall inbuilt `json` library](https://medium.com/dataweave/json-vs-simplejson-vs-ujson-2887b2c128b2).

```python
import ujson

ujson.loads(object_str)

```

The above example shows how to load a string which represents a valid python object using `ujson`.

Now that we have sped up on the loading of objects, let's think about comparisons. Since we have been saving the memory everywhere in this program, we can splurge on a bit of memory now. We will be storing all the objects that we need to compare in or check presence in as dictionaries. We will discuss why, shortly! Below is a small snippet which checks for the presence of "key2" in the dictionary.

```python
dict_A = {'key1': 1, 'key2': 2, 'key3': 3}
if 'key2' in dict_A:
	# do something

```

We could have implemented the above as a list of 'key1', 'key2' and 'key3' and then checked for the presence of 'key2' in that. Can you see the problem in that? It would have been a linear search while what we just did above is a constant time search since the keys of a dictionary are hashed and looked up using hash tables (this is for example, the actual implementation may differ). We have just saved ourselves so much of time otherwise this linear algorithm would have been executed thousands of millions of times, completing ruining our dreams of an efficient program. We could have forgotten about getting the result at all within the next few weeks!

NOTE: If you have to use lists, use them after converting to `set` since [membership tests are much faster in a set than list](https://www.quora.com/Why-is-a-set-faster-than-a-list-in-Python).

#### Other Small Improvements And Details

With the last discussion, we have come to an end and completed all steps we should be following in creating an efficient enough program for handling humongous files which neither fit in our disk nor memory. Can we do it better? Yes, definitely! I'll be listing a few points below which we can incorporate in order to make the program run faster.

- Completely avoid use of Global variables and pass variables as arguments or use local variables whenever necessary. [Source](https://stackoverflow.com/questions/12590058/python-performance-with-global-variables-vs-local)
- Try to avoid one liners and make variable assignments wherever necessary, this is counterintuitive but works how Python is implemented. [Source](https://stackoverflow.com/questions/36548518/why-is-code-using-intermediate-variables-faster-than-code-without/36549633)
- Use Cython packages wherever possible and the speed is crucial. I've not used it extensively above to keep the article simple. [Learn More](http://okigiveup.net/an-introduction-to-cython/)
- Use buffers instead of reading and writing one line at a time. We could have kept a fixed size buffer and then loaded N (some large number) lines, processed them, got the output as M (some large number) lines and then written them and repeated the cycle. [Source](https://stackoverflow.com/questions/49266939/time-performance-in-generating-very-large-text-file-in-python).

If you are interested in few more speed tips, [here](https://wiki.python.org/moin/PythonSpeed) is a list of other speed improvements one can look at.

## Conclusion
It is always fun to push your limits and learn better ways of using a language. Before this project came to me, I had never worked on such a huge dataset and, though the task seemed infeasible at the start, was completed with 5 hours of computation time.

Please feel free to provide feedback below and ask queries if you have any :smile: Also, if you can provide any better alternatives to the methods used above, please post below.