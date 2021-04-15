Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
  # Dashboard endpoints
    	post 'users', to: 'users#create'
    	get 'users/:id/circle', to: 'users#circle', as: 'users_circle'
    	post 'users/:id/post', to: 'posts#create', as: 'users_post'
    	get 'users/:id/circle/posts', to: 'posts#circle_posts', as: 'circle_posts'

    # Profile endpoints
    	get 'users/:id/galleries', to: 'galleries#index'
    	get 'users/:id', to: 'users#show'
    	get 'users/:id/post', to: 'posts#index'
      get 'distance', to: 'zip#distance' #(will require you to send two zips as query params) tells you distance between you and person’s profile you’re viewing

    # Galleries
    	post 'users/:id/galleries', to: 'galleries#create'
    	post 'users/:id/galleries/:gallery_id/photos', to: 'photos#create'
    	get 'users/:id/galleries/:gallery_id/photos', to: 'photos#index'

    # Discover
    	get 'discover/users', to: 'users#near_me'
    	get 'photos', to: 'photos#discover_index'
    	get 'users', to: 'users#index' # accepts ONLY one query param (location, medium, name)
    end
  end
end
