class AnswersController < ApplicationController
  def index
    @answers = Answer.paginate(:page => params[:page])
  end
end
