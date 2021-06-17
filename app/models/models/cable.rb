class Cable < ApplicationRecord
  before_create :initialize_status

  belongs_to :spreadsheet
  belongs_to :positions_cable

  validates :identification, presence: true
  validates :length, presence: true
  validates :predicted_elongation, presence: true

  private
    def initialize_status
      self.status = 0
    end
end
