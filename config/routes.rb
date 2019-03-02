Rails.application.routes.draw do
  resources :answers, only: [:index]

  mount PgHero::Engine, at: "pghero"
end
