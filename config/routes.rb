Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :consent_forms, only: [:create]
    end
  end
end
