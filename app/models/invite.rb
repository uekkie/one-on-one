class Invite < ApplicationRecord
  belongs_to :question_board
  delegate :user, to: :question_board

  has_one :answer_board

  has_secure_token :token

  validates :name, presence: true
  validates :email, presence: true
end
