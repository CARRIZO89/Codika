Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :buildings, only: [:index, :create] do
        resources :floors, only: [:index, :create] do
          resources :rooms, only: [:index, :create]
        end
      end
    end
  end
end
