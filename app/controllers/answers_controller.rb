class AnswersController < ApplicationController
  def index
    @answers = Answer.all.includes([:learner, { possible_answer: { question: :quiz }}])
                         .paginate(page: params[:page], per_page: 10)
  end
end
