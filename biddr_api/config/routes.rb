Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :auctions
      resource :session, only: [:create, :destroy]
      resources :users, only: [:create] do
        get :current, on: :collection
      end
    end
  end

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :auctions do
    resources :bids, only: [:create] 
  end
  get('/', { to: 'welcome#index', as: 'root' })

end
