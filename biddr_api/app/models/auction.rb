class Auction < ApplicationRecord
    belongs_to :user
    has_many :bids

    validates(:title, presence: true, uniqueness: true)
    validates(:description)
    validates(:ends_at)
    validates(:reserve_price)
end
