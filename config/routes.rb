Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth' => 'authentication#create'

      resources :schools, only: %i[create update destroy] do
        resources :recipients
      end
    end
  end
end
