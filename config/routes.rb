# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :companies do
    resources :users, only: [:index]
  end

  resources :tweets, only: [:index]
  get 'reports/companies_per_user'
  get 'reports/user_per_tweet'
  resources :reports, only: [:index]

  resources :users, param: :id, only: %i[index show] do
    get 'tweets', action: :tweets
    resources :tweets, only: [:index]
  end
end
