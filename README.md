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

## Solved

###### (added basic bootstrap and UI for joy of developing)

* Implemented auth0 authentication (+ [pull request proposition](https://github.com/auth0/docs/pull/7314/files) to Auth0 to fix quickstart docs) (bug on logout TODO in spare time)
* After login, user sees the answers table
* with required columns
* table is paginated
* filtering (few bugs to fix)
* sorting


Data for table is eager loaded
Indexes added:
```ruby
  :learners, :full_name
  :learners, :email, unique: true
  :quizzes, :name
  :questions, :title
  # Assuming people are learning to pass, so there will be much less incorrect answers, hence partial index on them is reasonable
  :possible_answers, :value, where: "value = 'Possible Answer Incorrect'"
  # As above, partial index is reasonable on not correct answers(as soon as I correctly understood meaning of these columns)
  :possible_answers, :correct, where: "correct = FALSE"
  # change autogenerated :answers, :possible_answer_id to (since there are only two possible values of :possible_answer):
  :answers, [:possible_answer_id, :learner_id]
```

* Sensitive data in dotenv and envied
* bin/setup improvement (not tested)