# frozen_string_literal: true
module ApplicationHelper
  # prevent queries for options on each render
  @@options_for_learners = nil
  @@options_for_quizzes = nil
  @@options_for_questions = nil
  @@options_for_possible_answers = nil

  def sortable(column, title)
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, sort: column, direction: direction
  end

  def options_for_learners
    @@options_for_learners ||= (options = [nil] << Learner.all.map(&:full_name).uniq).flatten
  end

  def options_for_quizzes
    @@options_for_quizzes ||= (options = [nil] << Quiz.all.map(&:name).uniq).flatten
  end

  def options_for_questions
    @@options_for_questions ||= (options = [nil] << Question.all.map(&:title).uniq).flatten
  end

  def options_for_possible_answers
    @@options_for_possible_answers ||= (options = [nil] << PossibleAnswer.all.map(&:value).uniq).flatten
  end
end
