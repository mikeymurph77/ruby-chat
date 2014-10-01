Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resource :dashboard, only: [:show]
  resources :users, only: [:show]
  resources :events, only: [:index, :show, :new, :create, :edit, :update]

  root to: "dashboards#show"
end
