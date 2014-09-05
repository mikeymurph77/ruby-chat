Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resource :dashboard, only: [:show]
  resources :users, only: [:show]

  root to: "dashboards#show"
end
