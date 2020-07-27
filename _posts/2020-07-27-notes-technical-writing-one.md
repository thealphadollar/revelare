---
title: Notes From Learning Technical Writing One
layout: post
section-type: post
featured_img: img/posts/technical-writing-one/feature.png
category: learning
tags:
- OpenSource
- courses
- tech
- programming practices
- notes
---

I recently did the [Technical Writing One](https://developers.google.com/tech-writing/one) and below are my notes from the same. The notes are arranged in the topic wise manner as is the pre-class material for the course.

---
### [Words](https://developers.google.com/tech-writing/one/words)
- Define new or unfamiliar terms; do not reinvent the wheel.
- Collect definition of unfamiliar terms in a glossary if too many.
- Use name consistently, do not change them in between the article.
- If name changes are required, for ex. Protocol Buffers to protobufs, use something like "Protocol Buffers (or protobufs for short)..."
- When using acronyms, bold the text with first writing full and acronym in brackers, for ex. **Hyper Text Markup Language (HTML)**.
- Don't define acronyms that would only be used a few times.
- Do define acronyms that meet both of the following criteria:
    - The acronym is significantly shorter than the full term.
    - The acronym appears many times in the document.
- Pronouns are analogous to pointers in programming, avoid using them with below guidelines.
    - Only use a pronoun after you've introduced the noun.
    - Place the pronoun as close as possible to the referring noun.
    - If you introduce a second noun between your noun and your pronoun, reuse your noun instead of using a pronoun.

### [Active vs Passive](https://developers.google.com/tech-writing/one/active-voice)
- Active Voice Sentence = actor + verb + target, "The cat sat on the mat".
- Passive Voice Sentence = target + verb + actor, "The mat was sat on by the cat".
- Passive verb = form of be + past participle verb.
- Imperative verbs, like open, set, etc., are active verbs where actor is implicit. 
- Use active voice more, passive voice less.
- Active voice provides the following advantages:
    - Most readers mentally convert passive voice to active voice; readers can skip the preprocessor stage and go straight to compilation.
    - Passive voice obfuscates your ideas, passive voice reports action indirectly.
    - Some passive voice sentences omit an actor altogether forcing the reader to guess the actor's identity.
    - Active voice is generally shorter.
- **Be bold, be active!**

### [Clear Sentences](https://developers.google.com/tech-writing/one/clear-sentences)
- Comedy writers seek the funniest results, horror writers strive for the scariest, and technical writers aim for the clearest.
- Choose precise, strong and specific verbs, rest of the sentence takes care of itself.
- "The error occurs when clicking the Submit button." vs "Clicking the Submit button triggers the error."
- Generic verbs may imply imprecise or missing actor or a passive voice statement.
- Reduce **There is** or **There are**; generic weddings bore readers.
- "There is a variable called met_trick that stores the current accuracy." -> "The met_trick variable stores the current accuracy."
- Avoid using "There is" or "There are" to bypass creating true subject or verb; take the pain of creating one.
- Creating real subjects or verbs make the sentence more clear and concise.
- Unfortunately, adjectives and adverbs sometimes make technical readers bark loudly and ferociously.
- Refactor adverbs and adjectives into objective numerical information, if possible, or omit them.

### [Short Sentences](https://developers.google.com/tech-writing/one/short-sentences)
- Shorter documentation reads faster, is easier to maintain and reduces points of failure.
- Focus each sentence on a single idea, thought, or concept just as a single statement of code.
- Convert long sentences to lists, if appropriate and fitting.
- Eliminate or reduce extranerous words; avoid junk words or exaggeration.
- Reduce subordinate clauses.
- Keep **one sentence = one idea** in mind.
- Reserve *which* for nonessential clauses and *that* for essential clauses.
- If you read a sentence aloud and hear a pause just before the subordinate clause, then use *which*. If you don't hear a pause, use *that*.

### [Lists and tables](https://developers.google.com/tech-writing/one/lists-and-tables)
- Technical readers love lists, convert prose into lists.
- Avoid using embedded lists, and break into bulleted or numbered.
- Keep lists parallel; parallel lists have items that "belong" together.
- Avoid usage of different voices (active and passive) in the items of the list.
- Start numbered lists with imperative verb.
- Only use sentence capitalization and punctuation when list items are complete sentences.
- Use tables to represent lists where properties and attributes are presented.
- Keep in mind the following while creating a table:
    - header should be meaningful
    - avoid too much text in a cell
    - strive for parallelism between columns
- Always introduce the table or list with an introductory sentence terminating with a column.

### [Paragraphs](https://developers.google.com/tech-writing/one/paragraphs)
- Opening sentence is very crucial; people see it to decide if they should skim through or read.
- First sentence should focus on the topic to be discussed in the paragraph.
- A paragraph should represent an independent unit of logic.
- Don't keep paragraphs too long or short; 3 to 5 sentences is ideal.
- Good paragraphs answer the following three questions in the given order:
    1. What are you trying to tell your reader?
    1. Why is it important for the reader to know this?
    1. How should the reader use this knowledge.

### [Audience](https://developers.google.com/tech-writing/one/audience)
- Documentation must be about bridging the gap between your audience's knowledge and the knowledge required to do *the task*.
- Understand the audience's role and proximity to the knowledge, first and foremost.
- Formulate a list of everything the audience needs to learn to do *the task*.
- Following are key points to fit documentation to the audience:
    - match vocabulary to the audience
    - safeground from **the curse of knowledge**
    - choose simpler words
    - avoid personal metaphors, cultural idioms, etc.
- If required, keep translation software effects in mind.

### [Documents](https://developers.google.com/tech-writing/one/documents)
- Define the scope and target of the document in the beginning.
- Additionally, brief about non-scopes and assumptions.
- The following three questions determine what document should contain:
    - Who is your target audience?
    - What do they need to know already?
    - What should they know or be able to do after reading the document?
- Mention all key points up front in an outline, provide hyperlinks if possible.
- Break the document into sections like writing modular code.

### [Punctuation](https://developers.google.com/tech-writing/one/punctuation)
- Following are some general rules of using comma:
    - wherever a reader would naturally pause
    - to separate items in an embedded list
    - between condition and consequence, for example "If the program runs slowly, try the --perf flag."
- Wedge a quick definition or disgression between pair of commas.
- Avoid comma to paste together two independent sentences.
- A semicolon unites highly related thoughts which should be complete sentences separately.
- Em-dashes ("-") represent a longer pause; a pair of them is used to enclose disgression.
- Use parentheses to hold minor points or disgressions; keep them to a minimal.
- Some standard rules regarding periods and parenthesis:
    - If a pair of parentheses holds an entire sentence, the period goes inside the closing parenthesis.
    - If a pair of parentheses ends a sentence but does not hold the entire sentence, the period goes just outside the closing parenthesis.

---
### [Summary](https://developers.google.com/tech-writing/one/summary)
The course is fun to do and easy to understand. Examples and exercises are catered towards a technical writer; I would pause sometimes to wonder how a suggestion would look like in actual writing of documentation and find the following example emphasing the same.

I'm looking forward to do [Technical Writing Two](https://developers.google.com/tech-writing/two) in the next few days.
