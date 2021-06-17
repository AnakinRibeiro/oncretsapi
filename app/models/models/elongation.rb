class Elongation < ApplicationRecord
  before_save :initialize_fields

  belongs_to :cable
  has_one :cables_reviews_type
  has_many :comments, as: :commentable

  validates :elongation, presence: true

  private
    def initialize_fields
      if !self.cables_reviews_type
        self.cables_reviews_type_id = 1
      end
    end
end
