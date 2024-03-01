Rails.application.routes.draw do
  root to: "top#index"
  devise_for :users
  resources :items do
    member do
      patch :complete
    end
  end
end
