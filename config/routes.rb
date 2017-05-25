Rails.application.routes.draw do
  root 'welcome#index'
  resources :posts
  get '/uptoken', to: 'posts#uptoken', as: 'uptoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
