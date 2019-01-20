class AnswerBoard < ApplicationRecord
  belongs_to :user
  belongs_to :member
  has_many :question_answers
end
