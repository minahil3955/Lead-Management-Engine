Rails.application.routes.draw do
  resources :comments
  resources :phases
  resources :clients
  resources :project_leads do
    resources :comments, module: :project_leads
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
