Rails.application.routes.draw do

  namespace :user do
  	root to: "posts#index"
    get 'folders/folders_create' => 'folders#new', as: 'folders_new'

    get 'contacts/:user_id/contact_completed' => 'contacts#contact_completed', as: 'contact_completed'
    get 'folder_contents/folder_contents_new/:post_id' => 'folder_contents#new', as: 'folder_contents_new'
    post 'folder_contents/folder_contents_create/:post_id' => 'folder_contents#create', as: 'folder_contents_create'
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
      resources :folders, only: [:index, :new, :update, :destroy] do
        resources :folder_contents, only: [:index, :new, :update, :destroy]
      end
    end
  	resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
  	 resources :comments, only: [:new, :create, :edit, :update, :destroy]
     resources :favorites, only: [:create, :destroy]
  	end
  	resources :questions do
      resources :question_comments, only: [:new, :create, :edit, :update, :deestroy]
    end
  	resources :contacts
  end

  namespace :admin do
  	resources :users
  	resources :users, only: [:create, :deestroy]
  	resources :posts
  	resources :comments
  	resources :favorites, only: [:create, :deestroy]
  	resources :questions
  	resources :contacts
  	resources :folders, only: [:create, :deestroy]
  	resources :memos
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
