Rails.application.routes.draw do
#   get 'gossips/index'
#   get 'gossips/new'
#   get 'gossips/create'
#   get 'gossips/show'
#   get 'gossips/edit'
#   get 'gossips/update'
#   get 'gossips/destroy'
#   get '', to: 'home#index'
#   get 'contact/show', to: 'contact#show'
#   get 'team/show', to: 'team#show'
#   get 'welcome/show/:user_name', to: 'welcome#show'
#   get 'gossip/show/:id', to: 'gossip#show', as: 'gossip'
#   get 'user/show:id', to: 'user#show', as: 'user'
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :welcome do
    resources :comments
  end

  resources :user do
    resources :comments
  end

  resources :contact do
    resources :comments
  end

  resources :team do
    resources :comments
  end

  resources :gossips do
    resources :comments
  end
end