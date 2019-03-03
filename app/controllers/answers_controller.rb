class AnswersController < ApplicationController
  include Secured
  helper_method :sort_column, :sort_direction
  
  def index
    if params[:answer]
      @answers = Answer.includes([:learner, { possible_answer: { question: :quiz }}])
                      .joins([:learner, { possible_answer: { question: :quiz }}])
                      .paginate(page: params[:page], per_page: 10)             
                      .order(sort_column + ' ' + sort_direction)
                      .send(:learner_filter, params)
                      .send(:possible_answer_filter, params)
                      .send(:question_title_filter, params)
                      .send(:quiz_filter, params)
      Rails.logger.info @answers
      @answers
    else
      @answers = Answer.all.includes([:learner, { possible_answer: { question: :quiz }}])                     
                          .paginate(page: params[:page], per_page: 10)             
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
