# config/routes.rb
Rails.application.routes.draw do
  # namespace :api, defaults: { format: :json } do
  #   resources :users, only: %w[show]
  # end

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :users, only: %w[index show]
    end
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/v1/login',
      sign_out: 'api/v1/logout',
      registration: 'api/v1/signup'
    },
     controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }
end
