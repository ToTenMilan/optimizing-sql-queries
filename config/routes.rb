Rails.application.routes.draw do
  resources :answers, only: [:index]
end
