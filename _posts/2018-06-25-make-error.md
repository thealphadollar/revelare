---
layout: post
section-type: post
title: "make Utility: Missing Library Errors"
category: fixes
tags: [ 'bug fix', 'linux', 'compilation', 'programming' ]
---
make is one of the most used utilities by developers worldwide. If you are a developer and have been compiling the entire code even with trivial single file changes, you need to look at this piece of awesomeness.

make determines automatically the parts of the program which require recompilation and issue commands to recompile them only. Not only is it useful for programs but also tasks where files need to be updated when changed.

---

make depends on a lot of libraries and they must be installed in the system for the proper functioning. This is all good till you face the below error,

```bash
/usr/bin/ld: cannot find -lz
collect2: error: ld returned 1 exit status
CmakeFiles/ccextractor.dir/build.make:2149: recipe for target 'ccextractor' failed
make[2]: *** [ccextractor] Error 1
CMakeFiles/Makefile2:67:  recipe for target 'CMakeFiles/ccextractor.dir/all' failed
make[1]: *** [CMakeFiles/ccextractor.dir/all] Error 2
Makedile:127: recipe for target 'all' failed
make: *** [all] Error 2

```
The above error comes when there is some library missing, and all we know is “cannot find -lz”. The error message is vague here and doesn’t tell exactly which library is missing. Even a run through stackoverflow adds nothing to the information.

The solution is installing “lib{x}-dev” where “x” is -l{x} in the error. For instance, in the case above, libz-dev is needed.

```bash
/linux$ sudo apt-get install libz-dev
Reading package lists... Done
Building dependency tree
Reading state information... Done
Note, selecting 'zlib1g-dev' instead of 'libz-dev'
The following NEW packages will be installed:
    zlib1g-dev

```

For a first timer, like me, it might take a day to figure out the solution; trying out multiple random hacks from here and there.

---

Overlooking the missing documentation for some errors, make is an amazing tool to be used in programs where a lot of files need to be managed at once. Summing up,

> make is the equivalent of traveling time; shrinking hours to minutes

