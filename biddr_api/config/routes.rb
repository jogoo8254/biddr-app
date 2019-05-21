Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :auctions do
    resources :bids, only: [:create] 
  end
  get('/', { to: 'welcome#index', as: 'root' })

end
