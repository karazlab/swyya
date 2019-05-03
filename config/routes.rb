Rails.application.routes.draw do
  devise_for :users

  %i[ideas projects].each do |module_controller|
    resources module_controller do
      member do
        post 'like'
        post 'dislike'
        post 'hide'
        post 'active'
      end
    end
  end
  
  root 'visitors#index'

  get '/board', to: 'boards#index', as: 'user_board'
end
