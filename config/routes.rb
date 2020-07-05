Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
 	:sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users/top#top"

  namespace :users do
  	resources :users
  	resources :questions do
  		resources :answers, only: [:create, :destroy]
  	end
  	resources :articles
  	resources :relationships, only: [:create, :destroy]
  	resources :post_images
  	resources :companies
  end
end
