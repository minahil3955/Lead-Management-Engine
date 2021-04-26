# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects, only: [:index]
  resources :clients, except: [:destroy]
  resources :project_leads do
    resources :comments, module: :project_leads
    resources :phases do
      resources :comments, module: :phases
      get 'complete', on: :member
      post 'engineer', on: :member
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :users do
    get '/sign_in' => 'devise/sessions#new'
    get '/sign_up' => 'devise/registrations#new', as: 'new_user_registration'
  end

  devise_for :users, skip: [:registrations]
  as :user do
    root to: 'project_leads#index'
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
end
