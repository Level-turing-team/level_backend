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
      get 'distance', to: 'zipcode#distance', as: 'distance' #(will require you to send two zips as query params) tells you distance between you and person’s profile you’re viewing
      post 'profiles/:id/circle', to: 'circles#create', as: 'circle_create'

    # Galleries
    	post 'profiles/:id/galleries', to: 'galleries#create', as: 'new_gallery'
    	post 'profiles/:id/galleries/:gallery_id/photos', to: 'photos#create', as: 'new_photo'
    	get 'profiles/:id/galleries/:gallery_id/photos', to: 'photos#index', as: 'user_photos'

    # Discover
    	get 'profiles/:id/discover', to: 'profiles#near_me', as: 'near_me'
    	get 'photos', to: 'photos#discover_index', as: 'discover_photo_index'
    	get 'profiles/:id/search', to: 'profiles#index', as: 'profile_search' # accepts ONLY one query param (location, medium, name)

      # Tags
      get 'profile/:id/tags', to: 'tags#index', as: 'tags_index'
      post 'tags', to: 'tags#create', as: 'tags_create'
      post 'profile/:id/tags', to: 'tags#tags_user_create', as: 'tags_user_create'
    end
  end
end
