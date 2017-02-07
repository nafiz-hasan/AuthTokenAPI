Rails.application.routes.draw do
  namespace :v1 do
    post 'authenticate', to: 'authentication#authenticate'
  end

  namespace :v2 do
    post 'authenticate', to: 'authentication#authenticate'

    resources :posts do
      resources :comments
    end
  end
end
