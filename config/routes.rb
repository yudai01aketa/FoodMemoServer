Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books, except: :show
      post 'sign_up', to:'users#sign_up'
      post 'login', to:'users#login'
    end
  end
end
