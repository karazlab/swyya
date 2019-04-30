Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    member do
      post 'like'
      post 'dislike'
      post 'hide'
      post 'active'
    end
  end

  root 'visitors#index'

  get '/board', to: 'boards#index', as: 'user_board'
end
