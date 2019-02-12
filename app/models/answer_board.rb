class AnswerBoard < ApplicationRecord
  belongs_to :invite
  has_many :answers
  accepts_nested_attributes_for :answers
end
