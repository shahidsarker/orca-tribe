Rails.application.routes.draw do

  root to: 'welcome_page#welcome'
  devise_for :users, :controllers => { registrations: 'registrations' }

  # devise_for :users
  # get '/dashboard' => 'homepage#dashboard'

 
get '/profile' => 'welcome_page#specific_user'
# get '/profile/:id/edit' => 'devise/registrations#edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'opps#index'  
  # devise_for :users
  # resources :orgs
  resources :opps do
    member do
      get 'bookmark'
      get 'unbookmark'
    end
  end

  resources :orgs do
    member do
      put "like", to: "orgs#like"
      put "unlike", to: "orgs#unlike"
    end
  end
end
