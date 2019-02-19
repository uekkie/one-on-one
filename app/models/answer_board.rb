class AnswerBoard < ApplicationRecord
  belongs_to :invite
  has_many :answers, dependent: :destroy, inverse_of: :answer_board
  accepts_nested_attributes_for :answers
end
