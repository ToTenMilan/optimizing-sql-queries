# frozen_string_literal: true
ApplicationRecord.transaction do
  correct = "Possible Answer Correct"
  incorrect = "Possible Answer Incorrect"
  1000.times do
    Learner.create full_name: Faker::Dune.character, email: Faker::Internet.email
  end
  learners = Learner.all
  # find(Learner.all.map(&:id)[rand(1000)])

  100000.times do |i|
    Quiz.create(name: "Quiz ##{i}").tap do |quiz|
      learner = learners[rand(1000)]
      4.times do |j|
        quiz.questions.create(title: "Question ##{j}").tap do |question|
          answers = [
            question.possible_answers.create(
              value: correct, question: question, correct: true
            ),
            question.possible_answers.create(
              value: incorrect, question: question, correct: false
            )
          ]
          
          10.times { Answer.create(learner: learner, possible_answer: answers[rand(2)]) }
        end
      end
    end
    print "." if i % 10000 == 0
  end
end
puts ''