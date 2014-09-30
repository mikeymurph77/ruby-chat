Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resource :dashboard, only: [:show]
  resources :users, only: [:show]
  resources :events, only: [:show, :new, :create]

  root to: "dashboards#show"
end
