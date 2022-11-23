---
title: My First IGDC; Totally Worth It!
description: Not long ago, I was working at Mercari Japan - as a software engineer
  on the Master-User Team for the Mercari C2C platform. Building apps that serve a
  purpose for the users and building games that are to be fun for the users - are
  poles apart in their concept. Or that's how I felt - and I needed to understand
  better. Adding to that, being the sole backend developer at the company didn't help
  much - I could get the perspective from artists and designers, though not for the
  engineering field. I wanted to understand how people were building multiplayer games,
  what technologies they were using, how were the optimizations carried out, and more
  about the technical challenges. While I was having those questions in my mind, a
  WhatsApp notification popped up...
image: img/posts/attending-igdc/feature.jpg
category: experience
tags:
- Work
- experience
- lila
- gaming
- conferences
- igdc
- mercari
layout: post
type: BlogPosting
section-type: post
author: thealphadollar
---

This is a write-up after a long time - it was the [news of leaving Mercari](https://thealphadollar.me/experience/2022/07/02/mercari-bye-bye.html) that I shared the last. Since then, after going through a tough phase of anxiety (a tale for another post), I've shifted to being a videogame backend developer at _LILA Games_. Being very new to the gaming ecosystem in India, I attended the IGDC this year - with support from the organization.

![]({{ 'img/posts/attending-igdc/igdc1.jpg' | relative_url }})
*IGDC's scale and its large number of sponsors!*

Before writing down my experience it is important to put forward the disclaimer - I'm so new to the game dev scene in India that I often look at it through the perspective of core software development I had been doing. The perspective along with my recency into game development is a huge factor towards shaping how I experienced the IGDC, and what I'm going to write forward.
## Perspective

Not long ago, I was working at Mercari Japan - as a software engineer on the Master-User Team for the Mercari C2C platform. Building apps that serve a purpose for the users and building games that are to be fun for the users - are poles apart in their concepts. Or that's how I felt - and I needed to understand better. Adding to that, being the sole backend developer at the company didn't help much - I could get the perspective from artists and designers, though not for the engineering field. I wanted to understand how people were building multiplayer games, what technologies they were using, how were the optimizations carried out, and more about the technical challenges. While I was having those questions in my mind, a WhatsApp notification popped up...

> Hyderabad chalega, IGDC ke liye?

Aha! I talked with Avinash and he was all in - it was warm to see them pushing me for having more exposure to the field, and while they emphasized IGDC is not always worth attending, it is worth it the first time! So, I didn't look back, booked my tickets, informed my friends, and there I was at the IGDC on 3rd November 2022!

## First Day; The Expo

I dropped off at Hyderabad around 8 in the morning - a calm city where I could book Rapido bikes in an instant and didn't find traffic, contrasting experience to living in Bangalore. The registration was to close by 10:30 AM, so I hurried and left for the venue - no Hyderabad exploration. Reaching the Hyderabad International Convention Centre, my first reaction was... HICC is huge! And it was painful since I ended up reaching the back gate - which was closed. Somehow, I made it to the entry and then like a curious cat, jumped right into the Expo hall.

![]({{ 'img/posts/attending-igdc/expo.jpg' | relative_url }})
*The Expo Hall*

First of all, I was surprised by the number of educational institutions that have come up to provide training for a career in gaming - the only one I was aware of during my school days (and probably it was the only one in existence back around 2015s) is _Backstage Pass School of Gaming_. On these booths were games in different categories - from top-view racing games to TPP adventures - being developed by students. Seeing the passion and excitement ushered hope in me that, in India, game development and gaming are only going to boom with better talent in the future (a perspective shared by Avinash, as well).

Then there were booths by India to AAA studios with games, technologies, and devices all around! _Rockstar_, _Unreal_, _Ogre Head Studios_ - you name the known gaming studios with Indian presence, and they were there. Indian Mythology was a major theme for the games at the Expo - with Indian cultural remakes of famous AAA games (like GTA) being a close second. Art and concepts were the strong aspects of all the games that were there - with _Yodha_ by _Ogre Head Studios_ standing out with its small team and excellent visual effects.

Strangely, the concept of small teams wasn't limited to a few studios - most of the games had a small passionate team of individuals working on them. I sense that primarily it is passion - while low risk-taking is a close factor as most of the projects seemed bootstrapped rather than funded. Having said that, sitting through the panels made me feel the funding scenario will change soon for the Indian gaming sector.

## The Talks (& Panels)

The panels and the talks at the IGDC were new to me, no surprise there having only attended a few technical conferences in my life. I'm used to having technical details and code snippets in the talks, and here it was mostly text and talk, even in the sessions I expected to be technical (for instance, "How Ubisoft Reduced QA Time"). Skipping the sessions that were around art, design, and career in gaming (80% of the talks, BTW), I felt the technical sessions could have been better and more.

In talks that were being presented by established game development companies (likes of _Rockstar_ and _Ubisoft_), they seemed to cling strongly to the idea of protecting their IP, technical tools, and present "miracles" - probably they wanted to attract engineers to interesting challenges and not reveal how they solve the challenges. For instance, I remember one of the talks that were about using automated QA in games - somewhat similar to unit testing. Shifting from manual tests to automated testing of game features using scripts helped them reduce test iteration time from tens of hours to a few hours. However, only the "what we achieved" was presented and now how we went along the way. As a developer, I know tests help develop and iterate faster without breaking existing code - what interests me is the process and tools a development team used to achieve the results and how they solved the challenges that they encountered, what were the tradeoffs and more. I heard a similar review for sessions in Art & Design by big names, though no first-hand comments there.

> The above doesn't imply all technical talks were the same; there were detailed ones as well on Unity URP, Memory Benchmarking, etc. by independent developers.

Panels were interesting - everything I heard was new (and hopeful) to me; the gaming scenario in India, how is the future scope, what is it like to have a career in gaming, and how to be a top ten per cent in the game development industry. I was especially intrigued by the talks that showed how new technologies such as 5G, advancements in machine learning, etc., are going to change the way games are developed - though fundamentally keeping how fun the game is at the core. A tiny distinction from previous technical panels that I have attended, I felt a lack of humbleness and ability to say "I don't know" for topics that were new and had no homework done by the panellists. At the same time, it could just be my less knowledge on the topic and I'm not able to see the bigger picture.

## Networking

The inability to accept a lack of understanding of a certain topic, especially technical (as that's the only aspect I know a bit about), seemed to stem from a thought I came across the last day, roaming around the booths presenting technologies to support game development and deployment. Taking on the good part first, I was amazed to see _The Gaming Project_, a service similar to _Google Stadia_ ([that closed down earlier this year](https://www.polygon.com/23378721/google-stadia-shutting-down)). The team seemed to have cracked down on the problem of latency and delivering gaming experience over the internet without installation - and the demo was sleek ([an interesting study on network protocols for online gaming](https://arxiv.org/abs/2012.06774)). I also came across AppSealing, a service that provides SDK to protect games from client-side hacks - an interesting and crucial piece of technology that, if it lives up to its promises, can safeguard freemium applications.

![]({{ 'img/posts/attending-igdc/booth.jpg' | relative_url }})
*Booths where most of the networking happens.*

Except for a few other technologies in addition to the aforementioned ones, I felt the rest were selling the jargon and buzzwords - with a few tricks up their sleeves. Making my opinion solely on the explanations by representatives at the booth, it seemed to be another wave of the metaverse and Web3 gimmicks. I'm not saying they are not useful, what I fail to understand is are the features worth the complexity and cost tradeoff. If I were ever to require such services, I would rather create a lean set of requirements I have and build it atop existing APIs - say a decentralized deployment service that uses Terraform to deploy to AWS, Azure, and GCP (and be tolerant to any of the services failing, a key selling point of [StackOS](https://www.stackos.io/)). I'm not saying it's the best way to do it, but it's the way I would do it and save costs.

## Everything Else

IGDC was great - and it made me feel humble about my knowledge and feats that students are making, and excited about how I can contribute to the gaming industry. To say that I'll continue to work on games is difficult - I'm not sure, but I'll try to build every next piece of code in excitement till I'm contributing to the gaming industry.

It wasn't all work at IGDC though, I made amazing friends there - it was a lucky group that became too comfortable too quickly. God knows how! I look forward to meeting the people again, and, if everything is aligned and I'm still working in the gaming industry, attend the IGDC again next year with an evolved outlook.
