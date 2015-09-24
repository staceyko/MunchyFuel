Rails.application.routes.draw do
  devise_for :users
  root to: 'photos#new'
  resources :photos
end
