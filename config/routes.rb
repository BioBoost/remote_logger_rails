Rails.application.routes.draw do
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  resources :messages
  resources :clients
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
