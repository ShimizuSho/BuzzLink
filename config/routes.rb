Rails.application.routes.draw do

  	root to: "user/posts#index"
  namespace :user do
    get 'folders/folders_create' => 'folders#new', as: 'folders_new'
    get 'users/about' => 'users#about', as: 'about'
    get 'contacts/:user_id/contact_completed' => 'contacts#contact_completed', as: 'contact_completed'
    get 'folder_contents/folder_contents_new/:post_id' => 'folder_contents#new', as: 'folder_contents_new'
    post 'folder_contents/folder_contents_create/:post_id' => 'folder_contents#create', as: 'folder_contents_create'
    patch 'folder_contents/folder_contents_update/:id' => 'folder_contents#folder_contents_update', as: 'folder_contents_update'
    get 'users/:user_id/evolution' => 'users#evolution', as: 'evolution'
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
      resources :messages, only: [:create]
      resources :rooms, only: [:create, :show, :index]
      resources :folders, only: [:index, :new, :update, :destroy] do
        resources :folder_contents, only: [:index, :new, :update, :destroy]
      end
    end
    resources :questions, only: [:index, :new, :create, :show, :update, :destroy] do
      resources :question_comments, only: [:create, :edit, :update, :destroy]
    end
  	resources :posts, only: [:index, :new, :create, :show, :update, :destroy] do
  	 resources :comments, only: [:create, :edit, :update, :destroy]
     resources :favorites, only: [:create, :destroy]
  	end
  	resources :contacts
    resources :degrees, only: [:new, :create, :edit, :update]
  end

  namespace :admin do
    root to: "home#top"
  	resources :users, only: [:index, :show]
  	resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
  	resources :favorites, only: [:create, :deestroy]
  	resources :questions, only: [:index, :show, :destroy] do
      resources :question_comments, only: [:destroy]
    end
  	resources :contacts, only: [:index, :destroy]
  	resources :folders, only: [:create, :deestroy]
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
  end

  devise_for :admins, controllers: {
  	sessions:      'admins/sessions',
  	passwords:     'admins/passwords',
  	registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  	sessions:      'users/sessions',
  	passwords:     'users/passwords',
  	registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
