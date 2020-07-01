Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
 	:sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :users do
  	resources :users
  	resources :questions
  	resources :articles
  end
end
