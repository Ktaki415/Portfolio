Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#top'
  get 'home/about'

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#following", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  get 'search' => 'posts#search', as: 'search'
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

end
