Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  resources :items

  resources :item_lists, only: [:new, :create]
 
  root to: 'application#welcome'
  resource :user do
    resources :lists, only: [:index, :show, :new, :create]
  end
end
