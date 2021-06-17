class Construction < ApplicationRecord
  belongs_to :company
  has_many :addresses, as: :addresseable
  has_many :phones, as: :phonesable
  has_many :spreadsheets

  validates :name, presence: true
end
