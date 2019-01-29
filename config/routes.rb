Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  as :user do
    delete '/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :answer_boards, except: %i(destroy update)
  # static_pagesのようなcontrollerにまとめるといいかも
  # simple formを使用した時に複数形でないとエラーが発生すると第一回目の時に話があった
  # 単数形で書く方が良い
  # 名詞ではない
  # ものではないのでmodelの考え方でないかもしれない
  # answer_boardsのcollectionにするといいかも
  resource :thanks, only: :show

  resources :question_boards do
    resources :questions, only: %i(index edit new create)
    resources :invites, module: :question_boards, only: %i(index new create)
  end
end
