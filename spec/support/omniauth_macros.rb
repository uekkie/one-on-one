module OmniauthMacros
  def google_mock
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
      {
        provider: 'google',
        uid: '12345',
        info: {
          name: 'mockuser',
          email: 'sample@mock.com'
        },
        credentials: {
          token: 'mockmock'
        }
      }
    )
  end
end

