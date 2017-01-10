Rails.application.routes.draw do
  namespace :v1 do
    resources :items
    post 'authenticate', to: 'authentication#authenticate'
  end

  namespace :v2 do
    resources :items
    post 'authenticate', to: 'authentication#authenticate'
  end
end
