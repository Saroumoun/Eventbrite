Rails.application.routes.draw do
  get 'users/show'
  root 'events#index'
  devise_for :users

  resources :events do 
  	resources :attendances
  	resources :charges, only: [:new, :create]
  end
  
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
