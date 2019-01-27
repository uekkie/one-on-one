Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  as :user do
    delete '/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :answer_boards
  resources :question_boards do
    resources :questions
    resources :invites, module: :question_boards
  end
  resources :invites, module: :users
  resource :survey
  resources :surveys
end
