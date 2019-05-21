Rails.application.routes.draw do
  resources :auctions do
    resources :bids, only: [:create] 
  end

end
