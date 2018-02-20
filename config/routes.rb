Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

	# root 	 'static_pages#home'
 #  # Static Pages
 #  get  	 '/help', 		to: 'static_pages#help'
 #  get  	 '/about', 	  to: 'static_pages#about'
 #  get  	 '/contact',  to: 'static_pages#contact'
 #  # Users
 #  get  	 '/signup', 	to: 'users#new'
 #  post   '/signup',   to: 'users#create'
 #  # Sessions
 #  get	   '/login',		to: 'sessions#new'
 #  post   '/login',		to: 'sessions#create'
 #  delete '/logout', 	to: 'sessions#destroy'

 #  # Followers
 #  resources :user do
 #    member do
 #      get :following, :followers
 #    end
 #  end

 #  # resources :users
 #  resources :account_activations, only: [:edit]
 #  resources :password_resets,     only: [:new, :create, :edit, :update]
 #  resources :microposts,          only: [:create, :destroy]
 #  resources :relationships,       only: [:create, :destroy]
end