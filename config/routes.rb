Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth' => 'authentication#create'

      resources :schools, only: %i[create update destroy]
    end
  end
end
