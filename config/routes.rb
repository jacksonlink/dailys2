Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'
  
  root 'welcome#index'

  devise_for :users
  resources :lists
  resources :responsibles
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
