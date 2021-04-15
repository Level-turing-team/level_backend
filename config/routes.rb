Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
  # Dashboard endpoints
    	post 'profiles', to: 'profiles#create'
    	get 'profiles/:id/circle', to: 'profiles#circle', as: 'profiles_circle'
    	post 'profiles/:id/post', to: 'posts#create', as: 'profiles_post'
    	get 'profiles/:id/circle/posts', to: 'posts#circle_posts', as: 'circle_posts'

    # Profile endpoints
    	get 'profiles/:id/galleries', to: 'galleries#index', as: 'gallery_index'
    	get 'profiles/:id', to: 'profiles#show', as: 'profile_show'
    	get 'profiles/:id/post', to: 'posts#index', as: 'posts'
      get 'distance', to: 'zip#distance', as: 'distance' #(will require you to send two zips as query params) tells you distance between you and person’s profile you’re viewing

    # Galleries
    	post 'profiles/:id/galleries', to: 'galleries#create', as: 'new_gallery'
    	post 'profiles/:id/galleries/:gallery_id/photos', to: 'photos#create', as: 'new_photo'
    	get 'profiles/:id/galleries/:gallery_id/photos', to: 'photos#index', as: 'photos'

    # Discover
    	get 'discover/profiles', to: 'profiles#near_me', as: 'near_me'
    	get 'photos', to: 'photos#discover_index', as: 'discover_index'
    	get 'profiles', to: 'profiles#index', as: 'profile_search' # accepts ONLY one query param (location, medium, name)
    end
  end
end
