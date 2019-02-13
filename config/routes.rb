Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  as :user do
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :answer_boards, except: %i(destroy update) do
    get 'thanks', on: :collection
  end

  resources :question_boards , expect: %i(destroy) do
    resources :questions, module: :question_boards, only: %i(new create)
    resources :invites, module: :question_boards, only: %i(index new create)
  end
end
