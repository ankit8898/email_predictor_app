Rails.application.routes.draw do

  namespace :api do
    resources :predictions, only: [:index,:create]
    resources :datasets,only: [:index,:create]
  end

end
