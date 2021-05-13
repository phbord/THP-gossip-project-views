Rails.application.routes.draw do
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'gossips#index', as: 'root'
  resources :gossips do
    resources :comments, except: [:index, :new] do
      resources :comments, except: [:index, :new]
    end
  end
  resources :welcome, only: [:show]
  resources :user, only: [:show, :create, :new]
  resources :sessions, only: [:show, :create, :new, :destroy]
  resources :city, only: [:show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :likes, only: [:create, :destroy]
  resources :tags
end