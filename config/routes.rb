Rails.application.routes.draw do
  resources :comments
  resources :clients, except: [:destroy]
  resources :project_leads do
    resources :comments, module: :project_leads
    resources :phases do
      resources :comments, module: :phases
    end
  end

  get 'project_lead/:project_lead_id/phase/:id', to: 'phases#complete', as: 'phase_complete'
  post 'project_lead/:project_lead_id/phase/:id', to: 'phases#engineer', as: 'phase_engineers'

  resources :projects, only: [:index]

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
