Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "/search" => "welcome#search", page:'search'
  get "/:page" => "welcome#show"
  get "/opportunity/:id" => "welcome#generate"
  get "/latest_opportunities/:no" => "welcome#no"

  root 'welcome#show', page: "index"

end
