Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users do
    resources :answer_boards
    resources :question_boards do
      resources :questions
    end
  end
end
