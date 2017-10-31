Rails.application.routes.draw do
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  resources :messages
  resources :clients

  # match "/messages/clear", to: "messages#clear", via: [:delete], as: :clear_messages
  match "/clients/clear_messages/:id", to: "clients#clear_messages", via: [:delete], as: :clear_messages

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
