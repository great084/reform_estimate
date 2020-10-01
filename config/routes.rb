Rails.application.routes.draw do
  # get 'estimates/new'
  # get 'estimates/edit'
  # get 'estimates/index'
  # get 'estimates/show'
  resources :estimates
  devise_for :users
  root 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
