class Answer < ApplicationRecord
  belongs_to :answer_board
  belongs_to :question
  
  validates :content, presence: true
end
