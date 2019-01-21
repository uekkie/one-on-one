Rails.application.routes.draw do
  root 'answer_boards#index'
  devise_for :users
end
