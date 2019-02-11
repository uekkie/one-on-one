class Question < ApplicationRecord
  belongs_to :question_board

  validates :title, presence: true
end
