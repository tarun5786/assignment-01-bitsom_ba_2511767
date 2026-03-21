## Vector DB Use Case
A law firm wanting build a database to answer question is trying to reduce time taken for understanding and decision making to the problem they are facing with.
Using a traditional database would utterly fail for this use case. Because the traditional database use keyword search technique where the database looks for location
of exact word match. When working in Law same context can be presented in differnt phrasing like  
- Termination clauses
- Grounds for dissolution
- Conditions for early exit

All these phrases have same meaning. If using traditional database and seaching "Termination" keyword alone may or may not give you the actual results.
So, this where the vector Databases shine. Instead of matching the words it understands meaning.
It converts both the contract text and the lawyer's question into numerical representations called embeddings that capture semantic relationships.  
So even if the wording doesn't match at all, the system recognizes that "termination" and "dissolution" are conceptually the same thing and surfaces the right clauses.
The workflow would look something like chunk the contract into sections, store those chunks as vectors, and when a question comes in, find the chunks that are semantically closest to it.
It's less like a keyword search and more like a reading comprehension tool. For a law firm handling complex contracts, that distinction genuinely matters.
