Rails.application.routes.draw do
  get 'home/show', to: 'home#show'
  get 'contact/show', to: 'contact#show'
  get 'team/show', to: 'team#show'
  get 'welcome/show/:user_name', to: 'welcome#show'
  get 'gossip/show/:id', to: 'gossip#show'
  get 'user/show:id', to: 'user#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
