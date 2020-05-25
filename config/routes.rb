Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # namespace :api, defaults: {format: :json}, path: '/', constraints: {subdomain: 'api'} do
  controller :venues do
    get 'best_seats/:seats', to: 'venues#find_best_seat'
  end
  resources :venues, only: [:index, :show, :create, :update, :destroy]
  # end
end
