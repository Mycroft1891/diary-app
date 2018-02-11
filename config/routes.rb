Rails.application.routes.draw do
  resources :photos
  root                'static_site#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :entries
end
