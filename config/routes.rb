Project2::Application.routes.draw do
  match "pages/login", :via => [:get,:post]

  get "pages/logout"
  root :to => "pages#login"
  get "users/new"
  match "users/create" => "users#create"
  match "users/chooseUser" => "users#chooseUser"
  match "users/edit" => "users#edit"
  match "users/update" => "users#update"
  match "pages/continue" => "pages#continue"
  get "users/edit"

  get "users/index"
  
  get "suggestions_users/new"
  match "suggestions_users/create" => "suggestions_users#create"
  match "suggestions_users/chooseSuggestion" => "suggestions_users#chooseSuggestion"
  match "suggestions_users/edit" => "suggestions_users#edit"
  match "suggestions_users/update" => "suggestions_users#update"  
  get "suggestions_users/edit"
  get "suggestions_users/index"
  match 'suggestions_users/findBySuggestion/:suggestion' => "suggestions_users#findBySuggestion"
  match "suggestions_users/new" => "suggestions_users#new"
  match "suggestions_users/create" => "suggestions_users#create"
end
