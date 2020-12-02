Rails.application.routes.draw do
  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions',
    :passwords => 'admins/passwords'
  }

  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    resources :users
    resources :questions
    resources :articles
    resources :programming_languages
    resources :companies do
      resources :evaluations
    end
  end

  root to: "users/top#top"

  namespace :users do
  	get "users/search" => "users#search"
  	put "questions/:id" => "questions#best_answer"

  	resources :users
    get "questions/genre/:id" => "questions#genre_index", as: "questions_genre"
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
