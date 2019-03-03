require "rails_helper"

describe 'UserFeature' do
  describe "Googleでサインアップ" do
    before do
      # OmniAuth.config.mock_auth[:google]=nil
      # Rails.application.env_config['omniauth.auth']=google_mock
      visit root_path
    end

    xit "サインアップするとユーザーが増える" do
      expect{
        click_link "Googleアカウントでログイン"
      }.to change(User, :count).by(1)
    end

    xit "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
      click_link "Googleアカウントでログイン"
      click_link "ログアウト"
      expect{
        click_link "Googleアカウントでログイン"
      }.not_to change(User, :count)
    end
  end
end
