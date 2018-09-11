Rails.application.routes.draw do

  root to: 'welcome_page#welcome'
  
  devise_for :users
  # get '/dashboard' => 'homepage#dashboard'

 
get '/profile' => 'welcome_page#specific_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'opps#index'  
  # devise_for :users
  resources :orgs
  resources :opps
end
