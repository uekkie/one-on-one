class Question < ApplicationRecord
  belongs_to :question_board

  validates :title, presence: true
  validates :question_board, presence: true
end
