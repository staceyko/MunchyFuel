Rails.application.routes.draw do
  devise_for :users
  root to: 'index#welcome'
end
