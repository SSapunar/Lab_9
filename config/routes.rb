Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root "home#index"

  resources :owners
  resources :pets
  resources :vets
  resources :appointments do
    resources :treatments, only: [:new, :create, :edit, :update, :destroy]
  end
end