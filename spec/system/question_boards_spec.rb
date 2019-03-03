require 'rails_helper'

RSpec.describe '質問ボード', type: :system do
  describe '新規作成機能' do

    context '新規作成画面で名称を入力したとき' do
      # before do
      #   OmniAuth.config.mock_auth[:google]=nil
      #   Rails.application.env_config['omniauth.auth']=google_mock
      #   visit root_path
      #   click_link "Googleアカウントでログイン"
      # end

      it '成功する' do
        # OmniAuth.config.mock_auth[:google]=nil
        # Rails.application.env_config['omniauth.auth']=google_mock
        visit root_path
        click_link "Googleアカウントでログイン"
        sleep 1

        visit new_question_board_path
        fill_in '名前', with: 'hoge'
        click_button '作成'
        expect(page).to have_selector '.alert-success', text: 'hoge'
      end
    end
  end
end
