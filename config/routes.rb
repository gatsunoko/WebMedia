Rails.application.routes.draw do
  resources :configrations
  resources :recommend_articles
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    sessions: "users/sessions",
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:index, :show, :edit, :update] do 
    member do
      get :role_edit
      patch :role_update
    end
  end

  resources :genres do
    member do
      get :articles
    end
  end
  root 'articles#index'
  get 'articles/search', to: 'articles/search#index'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
