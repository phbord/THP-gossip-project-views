Rails.application.routes.draw do
  get 'sessions/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/show'
  get 'sessions/edit'
  get 'sessions/update'
  get 'sessions/destroy'
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, only: [:show]
  resources :user, only: [:show, :create, :new]
  resources :city, only: [:show]

  resources :contact, only: [:index]
  resources :team, only: [:index]

  resources :tags

  resources :gossips do
    resources :comments, except: [:index, :new] do
      resources :comments, except: [:index, :new]
    end
  end
end