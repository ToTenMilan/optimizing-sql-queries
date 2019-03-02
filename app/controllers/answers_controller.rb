class AnswersController < ApplicationController
  def index
    # @answers = Answer.all
    @answers = Answer.paginate(page: params[:page], per_page: 10)
  end
end
