# frozen_string_literal: true
class AnswersController < ApplicationController
  include Secured
  helper_method :sort_column, :sort_direction
  
  def index
    if params[:answer]
      @answers = Answer.basic_query(params)
                      .send(:learner_full_name_filter, params)
                      .send(:possible_answer_value_filter, params)
                      .send(:question_title_filter, params)
                      .send(:quiz_name_filter, params)
                      .order(sort_column + ' ' + sort_direction)
    else
      @answers = Answer.all.basic_query(params)
                          .order(sort_column + ' ' + sort_direction)
    end
  end

  private

  def sort_column
    %w[
      learners.full_name
      learners.email
      quizzes.name
      questions.title
      possible_answers.value
    ].include?(params[:sort]) ? params[:sort] : 'learners.full_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
