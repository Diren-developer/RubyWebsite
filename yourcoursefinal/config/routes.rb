Rails.application.routes.draw do
  get 'profiles/index'
  resources :locations
  resources :categories
  resources :coordinators
  delete '/logout',  to: 'coordinators#destroy'
  resources :courses
  resources :votes
  resources :profiles
  get 'contact/index'
  post 'contact/index', to: 'contact#create'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
end
