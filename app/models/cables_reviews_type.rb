class CablesReviewsType < ApplicationRecord
    has_many :elongations
    validates :name, presence: true
end
