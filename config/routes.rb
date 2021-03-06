Rails.application.routes.draw do
  authenticate :admin_user do
    namespace :admin do
      resources :users
      resources :admin_users
      resources :books do
        member do
          get :approve
        end
      end
      resources :categories

      root "admin_users#index"
    end
  end

  root 'welcome#index'
  get '/terms_and_conditions', to: "welcome#terms_conditions"

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: { registrations: 'users/registrations', }

  devise_for :admin_users, controllers: { sessions: 'admin_users/sessions' }

  resources :categories, only: [:index, :show]

  resources :books do
    member do
      get :toggle_status
      get :assign
    end
  end

  resources :users do
    resources :books, only: [:index]
  end
end
