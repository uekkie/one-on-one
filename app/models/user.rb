class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: %i(google)

  has_many :question_boards
  has_many :invites
  has_many :answer_boards, through: :invites

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    return user if user
    user = User.create( email:    auth.info.email,
                        name:     auth.info.name,
                        provider: auth.provider,
                        uid:      auth.uid,
                        token:    auth.credentials.token,
                        password: Devise.friendly_token[0, 20],
                        meta:     auth.to_yaml
                      )
  end
end
