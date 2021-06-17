class Cable < ApplicationRecord
  has_paper_trail

  attr_accessor :quantity, :construction_id
  
  before_create :initialize_status

  belongs_to :spreadsheet
  belongs_to :positions_cable

  has_many :elongations

  validates :identification, presence: true
  validates :length, presence: true
  validates :predicted_elongation, presence: true

  default_scope { order("id DESC") }

  private
    def initialize_status
      self.status = 0
    end
end
