class AnswersController < ApplicationController
  include Secured
  helper_method :sort_column, :sort_direction
  
  def index
    @answers = Answer.all.includes([:learner, { possible_answer: { question: :quiz }}])                     
                         .paginate(page: params[:page], per_page: 10)             
                         .order(sort_column + ' ' + sort_direction)

    # @answers = Answer.all.joins(:learner).order(params[:sort])

    # @answers = Answer.all.includes([:learner, { possible_answer: { question: :quiz }}])
    #                     .joins([:learner, { possible_answer: { question: :quiz }}])
    #                     .paginate(page: params[:page], per_page: 10)                  
    #                    #  .order("'#{params[:sort]}'")
                         
                          
                         
  end

  private

  def sort_column
    %w[
      learners.full_name
      learners.email
      quizzes.name
      questions.title
      possible_answers.value
    ].include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
