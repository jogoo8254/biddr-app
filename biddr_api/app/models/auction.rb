class Auction < ApplicationRecord
    has_many :bids

    validates(:title, presence: true, uniqueness: true)
end
