class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :question_board

  has_secure_token :token

  validates :user, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
