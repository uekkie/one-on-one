class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :member
  belongs_to :question_board

  has_secure_token :survey_token
end
