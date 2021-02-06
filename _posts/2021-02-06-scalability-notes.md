---
title: Notes On Scalability
description: Around a month back I saw the CS75 Lecture on Scalability by David Malan.
  The write up contains the notes from the same that I wrote while revisiting the
  lecture.
image: img/posts/scalability-notes/feature.png
category: learning
tags:
- programming practices
- tech
- notes
- systems
- scalability
layout: post
type: BlogPosting
section-type: post
author: thealphadollar
---

Around a month back I saw the [CS75 Lecture on Scalability by David Malan](https://www.youtube.com/watch?v=-W9F__D3oY4). The write up contains the notes from the same that I wrote while revisiting the lecture.

{% include youtubePlayer.html id="-W9F__D3oY4" start=0 %}

---

- SFTP is better than FTP - in the latter credentials are also sent as plain text.
- VPS, on an abstract level, is a slice of the shared hardware with separate OS. Comparing to shared hosts, they share OS as well and hardware is not throttled per user.
- Vertical scaling - get more ram, more processors, more space, etc. There is a cap on vertical scalability.
- Processes usually happen in a sequential manner on a single core. With multiple cores, parallelism is achieved.
- The advancement in vertical scalability has improved the accessibility of VPSes.
- SSD >> SAS >> SATA HDD - order in terms of price and speed.
- Horizontal scalability is achieved by using multiple machines - spanning the load on the level.
- Load balancer distributes the traffic across multiple machines in horizontal scaling.
- Private IP addresses cannot be directly reached by the internet.
- Load balancing can happen on the basis of load, round robin, work distribution, etc.
- There are caches on different levels - browser, system, etc. storing DNS queries, website scripts, etc.
- In a scenario where separate hard drives are used in each machine, the session may break.
    - can be solved by having a separate micro-service for session connected to all machines
    - eliminates the redundancy since the micro-service is the bottleneck
- Redundant Array of Independent Disks (RAID)
    - RAID 0 - two identical hard drives with strip writing; some data in 1, some in 2, and so on
    - RAID 1 - two identical hard drives with both having the same data
    - RAID 10 - 4 identical drives with both striping and cloning
    - RAID 5 - 5 identical drives with 4 in striping and 1 for cloning
- A shared file server or database can solve the problem of cookies and sessions.
- Database replication solves the problem of single point of failure for storage.
- Storing the server name (present behind the load-balancer) also helps us in achieving sticky sessions.
- PHP accelerators helps speed PHP server by caching the OPCODES.
- Apache and other servers are highly optimized for serving static files.
- Caching, in various forms, is usually a key-value store and useful for optimization of redundant operations.
    - MySQL has caching inbuilt.
    - Memcached is a memory cache.
    - Garbage collection kicks out data from cache based on some rule.
- InnoDB supports transactions. There are other storage engines that provide different features.
- Replication is all about keeping multiple copies of same data. Master(s)-slave(s) architecture is an example of the same.
- A single level of micro-services is called a tier. Architectures are usually multi-tier.
- Load balances work in pair in a active-active mode. They send heartbeats to each other all the time. In active-passive, passive comes in picture when there is no heart beat from active.
- Partitioning is very common in databases - separation of data based on a high level attribute.
- The concept of network redundancy comes into play to avoid hardware level of failure in the network connections.
- Geography based load balancing is done on the DNS level, mostly.
- SSL is usually offloaded at the load-balancer level to save cost, time, and complexity.
- The principle of least privilege - only open those doors that people need to go through.
- There's always a trade-off - scalability is about finding balance based on requirements.

> **Nothing ever is perfect, there's always a *gotcha*.**
