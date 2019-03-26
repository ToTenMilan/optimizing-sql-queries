class Learner < ApplicationRecord
  has_many :answers, dependent: :destroy
end
