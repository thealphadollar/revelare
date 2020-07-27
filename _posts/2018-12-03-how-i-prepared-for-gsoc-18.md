---
layout: post
section-type: post
crosspost_to_medium: true
title: "GSoC: How? This? That?"
featured_img: img/posts/gsoc-guide/2.png
category: experience
tags: [ 'gsoc', 'opensource', 'nephos', 'ccextractor', 'guide' ]
---
![GSoC Tshirt]({{"img/posts/gsoc-guide/2.png" | absolute_url}})

Google Summer of Code has been announced again, and I'm all filled with nostalgia, but it's not the only things I'm full
with (:wink::wink:). With a motive of helping GSoC aspirants, I'll be summarising (in somewhat details), how I prepared
for GSoC 2018 and successfully completed [my project](https://summerofcode.withgoogle.com/projects/#5889497431015424) under [CCExtractor](https://ccextractor.org/public:gsoc:2018:thealphadollar).

The post is timeline based and it is near as follows:

- **December - January** : *Selecting the organization.*
- **January - February** : *Contributing to the organization and researching on the project.*
- **February - March** : *Writing the proposal.*
- **March - April** : *Contributing further to the organization.*

---
## December to January

![Starting]({{"img/posts/gsoc-guide/1.jpg" | absolute_url}})

### Getting Started

I foggily remember I started to contribute to open source from December beginning only with no intention to give an attempt
at GSoC since I was just a freshman. I participated in KWoC '17 and focused on learning the basics of contribution: how to 
write a good commit, what are the practices to be followed while sending Pull Requests and much more. One of the most important
skills I acquired during KWoC was how to ask good questions. Below are some of the resources one should absolutely go through just 
with an aim to make the open-source community a little more educated (to be followed in the given order for beginners):

- [Why Git? Teach me the basics!](https://hackernoon.com/understanding-git-fcffd87c15a3) 
- [Explain me the Jargons, please?](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)
- [Should my first commit message be "first commit"?](https://code.likeagirl.io/useful-tips-for-writing-better-git-commit-messages-808770609503)
- [How to write a good Pull Request?](https://blog.github.com/2015-01-21-how-to-write-the-perfect-pull-request/)
- [I want to do my first contribution, NOW!](https://www.firsttimersonly.com/)

And here's the most important (and I MEAN IT) resource: [Catb's Guide To Asking Smart Questions](http://www.catb.org/~esr/faqs/smart-questions.html).
It is one single resource that can make it or break it; it teaches the art of asking good questions and patience to look 
through existing answers. I'll quote one of the organizations' admin on how he reacted to someone asking "How to contribute".

> There is no better sign than that to put him on the blacklist!

Knowing how to [frame good problems](http://www.studygs.net/problem/problemsolvingv1.htm) and solve them by yourself is half the work done. Period.

### Filtering Organisations

If you note, I've used "filtering" and not "selecting"; it is not you who selects the organization, all you can do is limit
the organizations you can be selected by :grin:.

![Filtering]({{"img/posts/gsoc-guide/3.png" | absolute_url}})

I started filtering organizations around the last week of December and the process continued heavily till mid-January. Below
is the methodology I used to shortlist the organization I would apply to.

**i)** Going through the list of last year's organizations I picked those where I think I would be interested to work. I went through
all the organizations thrice; for those which interested me, I looked deeper: looked on their past year's projects and went through
their work on a surface level.<br/><br/>
**ii)** Once I had the interest-based list, I filtered out those with technologies which I did not know or was not willing to learn
anytime soon. One important consideration to make here is that not all the technologies listed are used, and one should thoroughly 
go through current projects of the organization before filtering them out.<br/><br/>
**iii)** At this step, I had around half a dozen organization and so should you. This step is where it starts to get a little tough. You should
filter out a few more projects after going through their communication channels, projects, codebases and beginner resources.<br/><br/>
**iv)** Join the communication channel for all the organization remaining in the list: solve their beginner issues, ask "smart" questions, send some PRs
and just stay there for a while. The point where you start feeling like you don't want to be a part of this community, leave the group. It can
be due to a lot of reasons: inactive channel, poor reviews, poor documentation etc.<br/><br/>
**v)** Ideally, you should be left with one or two organizations where you feel like home. In parallel, you should be in mid-January and ready for 
coding heavy work.

---
## January to February

![GSoC CCEx]({{"img/posts/gsoc-guide/4.png" | absolute_url}})

### At The Org

Every organization has a different method for assessing the project proposal. [Here](https://ccextractor.org/public:gsoc:ideas_page_for_summer_of_code_2018) is CCExtractor's guide for GSoC 2018; every
organization has similar pages and they explicitly tell how they will be judging the proposals. One point to keep in mind is that
they only apply these criteria AFTER they deem your proposal to be good enough.

Generally speaking, the best way to get selected is to come under the radar of mentors and admins; this can be done by 
solving issues, asking "smart" questions and guiding others towards useful resources. It might come to your mind that pinging the mentor personally
will help a lot but it does the opposite; stick to public channels for seeking help (in the beginning).

### The Project

Alongside, you should be going through the ideas and projects the organizations (in your list) have. There will always be a good
number of projects and you should select what interests you the most; nobody expects you to know how you wish to accomplish it at this moment.
But it is important you are passionate to complete it, and in the process learn the required technologies.

![Research]({{"img/posts/gsoc-guide/5.png" | absolute_url}})

Once you've finalized on the project (which should be totally based on interest), start figuring out what all the technologies you
would need to work on it and start learning about them. This time should be optimized for researching on various methods and
figuring out what will work the best in the production; finding the best method for an action will give you lead over other proposals for the
same project.

You should keep a detailed record of your experiment with different technologies to present in the proposal. While researching
for my GSoC project, I created a fully fledged [Google Drive client](https://github.com/thealphadollar/GDrive_Sync) as a prototype for methods I had suggested in my proposal. This
helps a lot in convincing that you know what you are talking (or writing) about.   

---
## February To March

### Writing The Proposal

I began writing the proposal around early February; it is advisable to start writing the proposal immediately after you've selected
the project(s) you want to work on. There are [many formats for proposal](https://github.com/saketkc/fos-proposals), and some organization even define how they want the proposal
to be and what all they want you to include. If the organization is open to all formats, it is suggested to take inspiration from
proposals that got selected in previous years. Here is [my proposal](https://github.com/thealphadollar/Nephos/blob/master/Proposal_%20Project%20Nephos%2C%20GSoC%202018.pdf) as a reference which was
slightly inspired by previous proposals (especially [Saurabh Srivastava's](https://github.com/saurabhshri/GSoC-2017-Accepted-Proposals/blob/master/CCExtractor/CCAligner%20-%20Word%20by%20Word%20Audio%20Subtitle%20Sync/5565268630700032_1490805743_Word_by_Word_Subtitle_Sync_by_Saurabh_Shrivastava_CCExtractor.pdf)) submitted to my organization.

![Writing The Proposal]({{"img/posts/gsoc-guide/6.jpg" | absolute_url}})

There is an usual friction in starting to write the proposal; I faced it and it took me three days to write the first page. This
is not a good place to get stuck at, and should be avoided by writing the obvious parts of the proposal (introduction and contact details, for example) first.
One should be very very patient while writing the project since it can (and should) take up a month.

You should read "How to write a kick-ass proposal for Google Summer of Code" by TEO where he explains in-depth how you should
go about writing the proposal. Please note that proposals should only be limited by your imagination (and organizations' specifications) and
NO guide should be followed rigorously.

Contributions and other community involvement should be going abreast; one should avoid to have long inactivity in the channel, and never
miss conversations about the project.

---
## March To April

### Submission

The proposal should be in final stages by the week of submission and should be given to your seniors and mentors for review.
Do not share the proposal publicly, and only share links with commenting rights; there are always some cases of plagiarised 
proposals and you should be cautious.

A good sign of selection, at this time, is that your mentor should be talking to you in detail about the project and expecting
a proposal from you on the same. 

![Project Submitted]({{"img/posts/gsoc-guide/7.jpg" | absolute_url}})

A word of advise - although you can submit at most three proposals, it is advisable to NOT submit more than once unless
you are not well prepared, or unsure about your selection in your primary organization. 

### After Submitting

DO NOT become inactive in the community after submitting the proposal; keep solving issues, reviewing PRs, helping others and 
asking "smart" questions. Many organizations keep this time for judging the student's commitment since now he has no pressure of
writing the proposal and should be contributing directly to the organization.

---
![GSoC MEME]({{"img/posts/gsoc-guide/end.jpg" | absolute_url}})

This wraps up the technical and organizational part of the preparation. There will be many emotional challenges you'll be facing
while submitting the proposal: you'll lose hope at times, your patience might get over, you might grow jealousy towards your competitors and
much more. It is highly important to keep yourself emotionally healthy during this phase; talk to your family, friends, and seniors
for help and motivation.

I'm highly grateful :pray: to [Himanshu Mishra](https://www.github.com/orkohunter) and [Naresh Ramesh](https://www.github.com/ghostwriternr) for being
my mentors during my preparations. 
