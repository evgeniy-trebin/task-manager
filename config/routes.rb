Rails.application.routes.draw do
  root 'home#welcome'
  resource :session, only: [:new, :create, :destroy]
  namespace :personal_account do
    root 'tasks#index'
    resources :tasks do
      resources :attach_files, except: :index do
        get :download, on: :member
      end
    end
  end
end
