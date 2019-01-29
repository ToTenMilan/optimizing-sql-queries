ApplicationRecord.transaction do
  learner = Learner.create full_name: Faker::Dune.character, email: Faker::Internet.email

  5.times do |i|
    Quiz.create(name: "Quiz ##{i}").tap do |quiz|
      4.times do |j|
        quiz.questions.create(title: "Question ##{j}").tap do |question|
          answers = [
            question.possible_answers.create(
              value: "Possible Answer Correct", question: question, correct: true
            ),
            question.possible_answers.create(
              value: "Possible Answer Incorrect", question: question, correct: false
            )
          ]
          10.times { Answer.create(learner: learner, possible_answer: answers[rand(2)]) }
        end
      end
    end
  end
end
