Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  as :user do
    delete '/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :answer_boards, except: %i(destroy update) do
    get 'thanks', on: :collection
  end

  resources :question_boards do
    resources :questions, only: %i(index edit new create)
    resources :invites, module: :question_boards, only: %i(index new create)
  end
end
