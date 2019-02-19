class Answer < ApplicationRecord
  belongs_to :answer_board, inverse_of: :answers
  belongs_to :question
  
  validates :answer_board, presence: true
  validates :content, presence: true
end
