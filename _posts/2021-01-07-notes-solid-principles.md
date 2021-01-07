---
title: Notes For SOLID Software Design Principles
description: |-
  Yesterday I had the opportunity to sit through the talk (virtually) - [*Becoming a better developer by using the SOLID design principles* by *Katerina Trajchevska*](https://www.youtube.com/watch?v=rtmFCcjEgEw). The talk provided me the opportunity to learn better and revisit SOLID principles for software design. The blog contains notes from the same for me to revise quickly in the future.

  Please note that most of the principles are from the perspective of Object-Oriented Programming. Nonetheless, they are, with flexibility, applicable to all architectures and paradigms of software designing.
image: img/posts/notes-solid-principles/feature_solid.png
category: learning
tags:
- programming
- experience
- coding
- lessons
- programming practices
- notes
- careshare
- zealth-ai
layout: post
type: BlogPosting
section-type: post
author: thealphadollar
---

Yesterday I had the opportunity to sit through the talk (virtually) - [*Becoming a better developer by using the SOLID design principles* by *Katerina Trajchevska*](https://www.youtube.com/watch?v=rtmFCcjEgEw). The talk provided me the opportunity to learn better and revisit SOLID principles for software design. The blog contains notes from the same for me to revise quickly in the future.

Please note that most of the principles are from the perspective of Object-Oriented Programming. Nonetheless, they are, with flexibility, applicable to all architectures and paradigms of software designing.

---
## Background
- Average developers tend to spend more time reading code than writing.
- When writing code, we procrastinate and convince ourselves that we don't have enough time to do code structuring.
- Mostly happens in the initial stages of the engineering process - once it is neglected, becomes the dreaded "legacy code".
- Nobody wants to improvise and restructure the legacy code- if the mammoth is moving, let it move.

---
## Purpose
- SOLID makes code more maintainable, extensible, and easier to understand.
- SOLID saves time exponentially as more code is added, more developers join in, and as time passes in general.
- We don't come back to our own code after two years and ask, "What did I do?".

---
## Single Responsibility Principle
> Object (as used anywhere in the post) may be a class, function, method, entity, etc.

- The basic principle is everything should have a single place and should be placed in a single place.
- In terms of code, a single object should perform only a single responsibility.
- The object should only have a single reason to be modified.
- In terms of applicability, find one reason to change and take everything else out of the object.
- Use precise names for specific objects and generic names for broad objects.
- An example- the aim of a controller should only be to accept a request and return a response. It should know more than what is required to do the aforementioned.

---
## Open - Closed Principle
- An object should be open for extension and closed for modification.
- New features should be added by writing new code, not modifying existing code.
- Behavior separation helps.
- Goal is to get to a point where we can never break the existing system.
- For instance, using a Factory object to manage different types of the same flow is helpful in following OCP.

---
## Liskov Substitution Principle
- Any derived object should be able to substitute its parent object.
- Consumer should never have to know the specific object it is using.
- A red flag is when we have to rewrite all the methods of the parent class.
- High code reusability is achieved.

---
## Interface Segregation Principle
- Segregate code into smaller methods.
- Clients should only depend on the methods that they use.
- An example - in a notification sending object with multiple methods to send a notification, a client using `sendMail` should only depend on the `sendMail` method. Not the entire object.

---
## Dependency Inversion Principle
- Avoid depending on concrete implementations.
- Prefer to depend on a high level of abstractions as possible.
- Helps in modifying the underlying implementation without changing the high-level code.

---
## To Keep In Mind
- The aim of SOLID is to improvise the maintainability and readability of the code.
- The SOLID principles are PRINCIPLES and NOT RULES.
- SOLID principles should not be used just for the sake of using them.
- The principles should serve a purpose other than showing off developing skills and writing picturesque code.
- Context and common sense are of utmost importance while aiming to use the principle.
- Ask yourself the question, "Does it help me achieve a better maintainability?".

> **SOLID is your tool, not your goal.**

---
## Personal Experience
- Working on a startup is fast-paced and dynamic.
- We tend to not focus on the "Production Capability" of our code.
- I've personally found that deliberately investing time to follow SOLID principles, adding documentation, API testing mechanisms, etc. saves a lot of time.
- For instance, I'm working with `Zealth-AI`. Using a modular approach to implement notification sender, we have saved hours of work in the extension process for implementing new ways of communication.
- Following SOLID should be done flexibly and with the context in mind.
- If a feature takes 10 hours to implement with SOLID in mind and substantially less otherwise, I'd prefer not to use SOLID.
- Using all the principles in every implementation is futile; only use as much is beneficial in the long run for maintainability.
