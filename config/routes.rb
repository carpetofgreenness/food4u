Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :foods, :kitchens, :lists
  root "pages#home"
  get "pages/home"

  get 'search' => "pages#test_api"
  get 'find' => "pages#find"
  get '/api-find' => "pages#api_find"
  get '/guide-find' => "pages#guide_find"
  
  get "/list", to: "pages#list"
  get "/kitchen", to: "pages#kitchen"
  
end
