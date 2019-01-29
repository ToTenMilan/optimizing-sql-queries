# Backend Recruitment Task

* Implement a simple application that will allow Users to sign in through [Auth0](https://auth0.com/).
* Once signed in, a User can see a table, rendered on the server, filled with data from the `answers` table.
* The table should contain the following columns:
  * Learner name, Learner email, Quiz name, Question title, Answer value, Answer correctness, Answer creation date
* The table should be paginated
* The table should be filterable, as HTML selects, on:
  * Quiz, Question, Learner and Answer correctness
* The table should be sortable on:
  * Quiz name, Question title, Learner name, Learner email, Answer value

Treat the table as production-ready, meaning it should perform on large datasets.
Use dotenv and envied for sensitive data.

Improve the `bin/setup` script to ask for/generate all required configuration variables
