class Spreadsheet < ApplicationRecord
  belongs_to :construction
  has_many :cables
  has_many :jacks_uses
  has_many :jacks, through: :jacks_uses

  validates :name, presence: true
end
