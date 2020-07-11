Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
 	:sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users/top#top"
  
  namespace :users do
  	get "users/search" => "users#search"
  	put "questions/:id" => "questions#best_answer"

  	resources :users
  	resources :questions do
  		resources :answers, only: [:create, :destroy] do
  			resource :favorites, only: [:create, :destroy]
  		end
  		post "favorites" => "favorites#question_favorite_create", as: "favorites"
      delete "favorites" => "favorites#question_favorite_destroy"
  	end

  	resources :articles do
  		post "favorites" => "favorites#article_favorite_create", as: "favorites"
      delete "favorites" => "favorites#article_favorite_destroy"
      resources :post_comments, only: [:create, :destroy]
  	end

  	resources :relationships, only: [:create, :destroy]
  	resources :post_images

  	resources :companies do
	  	resources :evaluations do
	  		collection do
	  			get :next
	  			post :next
	  		end
	  	end
	  end

  end
end
