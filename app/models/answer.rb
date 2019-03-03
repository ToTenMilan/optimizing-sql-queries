class Answer < ApplicationRecord
  belongs_to :learner
  belongs_to :possible_answer

  scope :learner_filter, -> (params) {
    if params[:answer][:learner_full_name]
      where(learner_id: Learner.where(full_name: params[:answer][:learner_full_name]))
    end
  }

  scope :possible_answer_filter, -> (params) {
    Rails.logger.info 'in pos answer filter ========='
    if params[:answer][:possible_answer_value]
      Rails.logger.info 'in pos answer filter before where ========='
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

  scope :quiz_filter, -> (params) {
    Rails.logger.info 'in quiz filter ========='
    if params[:answer][:quiz_name]
      Rails.logger.info 'in quiz filter before where ========='
      where(
        possible_answer_id: PossibleAnswer.where(
          question_id: Question.where(
            quiz_id: Quiz.where(name: params[:answer][:quiz_name]))))
    end
  }
end
