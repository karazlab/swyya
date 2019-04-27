Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    member do
      post 'like'
      post 'dislike'
    end
  end
  root 'visitors#index'
end
