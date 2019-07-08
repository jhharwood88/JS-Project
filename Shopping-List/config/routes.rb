Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :items

  resources :item_lists, only: [:new, :create]
 
  root to: 'application#welcome'
  resource :user do
    resources :lists, only: [:index, :show, :new, :create]
  end
end
