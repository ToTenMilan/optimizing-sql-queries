class PossibleAnswer < ApplicationRecord
  belongs_to :question
  has_many :answers
end
