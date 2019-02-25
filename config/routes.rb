Rails.application.routes.draw do
  root 'events#index'
  devise_for :users

  resources :events do 
  	resources :attendances
  end
  
  resources :users, only: [:show, :edit, :update]
  

	namespace :admin do
		root 'admin#index'
	end
end
