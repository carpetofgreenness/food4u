Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :foods, :lists, :kitchens, only: [:create, :update, :destroy] 
  get "/foods/:id", to: "foods#destroy"
  delete "/foods/:id/eaten", to: "foods#destroy_eaten", as: "destroy_eaten"
  post "/to_kitchen/:id", to: "foods#to_kitchen", as: "move_to_kitchen"
  post "/to_list/:id", to: "foods#to_list", as: "move_to_list"
  post "/to_list/:id/trashed", to: "foods#to_list_trashed", as: "move_to_list_trashed"
  post "/to_kitchen_new", to: "foods#to_kitchen_new", as: "to_kitchen_new"
  

  root "pages#home"
  get "pages/home"

  get 'search' => "pages#test_api"
  get 'find' => "pages#find"
  get '/api-find' => "pages#api_find"
  get '/guide-find' => "pages#guide_find"

  get '/data' => "pages#data"
  
  get "/list", to: "pages#list"
  get "/kitchen", to: "pages#kitchen"

  get 'graph/index'
  get 'graph/data' => "graph#data"
end
