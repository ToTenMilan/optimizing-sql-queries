Rails.application.routes.draw do
  root 'home#show'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get '/logout' => 'logout#logout'

  resources :answers, only: [:index]

  mount PgHero::Engine, at: "pghero" if Rails.env.development?
end
