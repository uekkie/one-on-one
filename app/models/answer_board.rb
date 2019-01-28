class AnswerBoard < ApplicationRecord
  belongs_to :user
  belongs_to :invite
  has_many :answers
  # has_many :question_answers
end
