Rails.application.routes.draw do
  root                'static_site#home'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: [:show]
  resources :entries
end
