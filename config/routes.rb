Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  controller :venues do
    get 'best_seats/:seats', to: 'venues#find_best_seat'
    get 'reset', to: 'venues#reset'
  end
  resources :venues, only: [:index, :show, :create, :update, :destroy]

  root to: 'venues#index'
end
