Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :companies do
    member do
      get :products
    end
    resources :products
  end
  
  resources :products, only: [:index] do
    member do
      delete :delete_image
    end
  end
end
