---
title: Notes From Learning Technical Writing Two
layout: post
section-type: post
image: img/posts/technical-writing-one/feature.png
category: learning
tags:
- opensource
- OpenSource
- courses
- programming
- programming practices
- technical-writing
- notes
- google
---

After completing [Technical Writing One](/learning/2020/07/27/notes-technical-writing-one.html) course from Google, I've finally finished the [Technical Writing Two](https://developers.google.com/tech-writing/two). This write up contains my notes and is aimed at anyone looking to review the learned concepts in a quick go.

### [Self-editing](https://developers.google.com/tech-writing/two/editing)
- Think like your audience; read your draft from their point of view.
- Define a persona for the audience.
- Specify if audience needs to brush up on specific topics.
- Do not overdo relying on persona, it can make the document narrowly focused.
- Read your draft loud; take note of awkward phrasing, too-long sentences, or anything else that feels unnatural.
- Come back to the draft later for a fresh perspective.
- A change of context (or media) when reviewing your own work can help you find things to improve.
- Get peer-reviewed.

### [Organizing large documents](https://developers.google.com/tech-writing/two/large-docs)
- How-to guides, introductory overviews, and conceptual guides often work better as shorter documents.
- In-depth tutorials, best practice guides, and command-line reference pages can work well as lengthier documents.
- Start with a structured, high-level outline of the document. Below are key guidelines for outline:
    - explain why user needs to know something before explaining it to them
    - limit each step of outline to describing a concept or performing a specific task
    - introduce information when it's relevant to the reader
    - follow concepts with demonstrations
    - sharing outline with team is helpful on collaborative projects
- Always introduce the document to the readers including:
    - what the document covers
    - expected prior knowledge
    - what the document doesn't cover
- Review and revise the introduction once the document is complete.
- Add table of contents with navigation which should include:
    - introduction and summary sections
    - a clear, logical development of the subject
    - headings and sub-headings
    - show where user is in the document
    - link to related resources
    - link to what to learn next
- Use task-based headings with familiar terms to the user.
- Provide description under each heading before introducing a sub-heading.
- Disclose information progressively in the following manner:
    - introduce new terminology and concepts near to usage
    - breakup large walls of text
    - breakup large series of steps
    - start with simple examples, then move to complications

### [Illustrating](https://developers.google.com/tech-writing/two/illustrations)
- Majority of readers enjoy illustrations.
- Write the caption before illustration and they should:
    - be brief
    - explain the takeaway
    - focus the reader's attention
- Don't put more than a single paragraph worth of information in a diagram, avoid visual run-ons.
- Organize complex systems into subsystems to present better illustrations.
- Add visual cues and callouts to focus reader's attention on a key element of an illustration.
- Always review and revise illustrations just like text.

### [Creating Sample Code](https://developers.google.com/tech-writing/two/sample-code)
- Good sample code is often the best documentation.
- Good samples are correct and concise code that your readers can quickly understand and easily reuse with minimal side effects.
- The following are properties of good sample code:
    - build without errors
    - perform the expected task
    - concise and maintained
    - avoid security flaws
    - follow language specific conventions
- Snippet heavy documentation often degrades over time.
- Specify how to run the sample code and the expected result.
- Key points to create good sample code:
    - use descriptive class, method and variable names
    - avoid complex programming tricks
    - avoid deep nesting
    - highlight specific important sections of the code
- Augment sample code with comments on the following guidelines:
    - keep them short, clear
    - avoid commeting about obvious code
    - only comment non-intuitive statements
    - explain why, not what for experienced readers
- Put lengthy or descriptive comments in a separate paragraph, not in sample code.
- Consider potential side-effects of the code and mention the same.
- Sometimes showing both example and anti-example is necessary to avoid confusion.
- Sequence the code samples in a basic to complex manner, starting with "Hello World".

### [Summary](https://developers.google.com/tech-writing/two/summary)
The entire course (pre-class material) has given me a new perspective to writing technical document. Having said that, I do find that the learning is equally useful in non-technical writings as well.

The best part about doing the course for me has been the acquisition of a fresh look at writing with keeping in mind the audience at forefront.
