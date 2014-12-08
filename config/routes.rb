Rails.application.routes.draw do
  root to: "admin/dashboard#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :consent_forms, only: [:create]
    end
  end
end
