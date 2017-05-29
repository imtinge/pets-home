Rails.application.routes.draw do
  resources :posts
  resources :reporters do
    member do
      post 'has_found'
    end
  end
  post '/upload', to: 'posts#upload', as: 'upload'
  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
