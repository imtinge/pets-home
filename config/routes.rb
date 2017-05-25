Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get '/uptoken', to: 'posts#uptoken', as: 'uptoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
