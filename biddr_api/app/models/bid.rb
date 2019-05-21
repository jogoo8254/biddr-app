class Bid < ApplicationRecord
    belongs_to :auction
    validates :body, presence: true

end
