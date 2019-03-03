# frozen_string_literal: true
class Answer < ApplicationRecord
  belongs_to :learner
  belongs_to :possible_answer

  scope :learner_full_name_filter, -> (params) {
    if params[:answer][:learner_full_name]
      where(learner_id: Learner.where(full_name: params[:answer][:learner_full_name]))
    end
  }

  scope :possible_answer_value_filter, -> (params) {
    if params[:answer][:possible_answer_value]
      where(possible_answer_id: PossibleAnswer.where(
        value: params[:answer][:possible_answer_value]))
    end
  }

  scope :question_title_filter, -> (params) {
    if params[:answer][:question_title]
      where(
        possible_answer_id: PossibleAnswer.where(
          question_id: Question.where(title: params[:answer][:question_title])))
    end
  }

  scope :quiz_name_filter, -> (params) {
    if params[:answer][:quiz_name]
      where(
        possible_answer_id: PossibleAnswer.where(
          question_id: Question.where(
            quiz_id: Quiz.where(name: params[:answer][:quiz_name]))))
    end
  }

  def self.basic_query(params)
    includes([:learner, { possible_answer: { question: :quiz }}])
    .paginate(page: params[:page], per_page: 10)             
  end
end
