Rails.application.routes.draw do
  devise_for :users

  %i[projects].each do |module_controller|
    resources module_controller do
      member do
        post 'like'
        post 'dislike'
        post 'hide'
        post 'active'
      end
    end
  end
  
  resources :ideas do
    member do
      resources :comments
      post 'like'
      post 'dislike'
      post 'hide'
      post 'active'
    end
  end

  root 'visitors#index'

  get '/board', to: 'boards#index', as: 'user_board'
  get '/search', to: 'visitors#search', as: 'search_results'
end
