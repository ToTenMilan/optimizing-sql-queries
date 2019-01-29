class Answer < ApplicationRecord
  belongs_to :learner
  belongs_to :possible_answer
end
