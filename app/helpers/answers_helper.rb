# frozen_string_literal: true
module AnswersHelper
  def options_for_learners
    (options = [nil] << Learner.all.map(&:full_name).uniq).flatten
  end

  def options_for_quizzes
    (options = [nil] << Quiz.all.map(&:name).uniq).flatten
  end

  def options_for_questions
    (options = [nil] << Question.all.map(&:title).uniq).flatten
  end

  def options_for_possible_answers
    (options = [nil] << PossibleAnswer.all.map(&:value).uniq).flatten
  end
end
