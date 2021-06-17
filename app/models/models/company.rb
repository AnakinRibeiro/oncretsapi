class Company < ApplicationRecord
  has_many :users
  accepts_nested_attributes_for :users, allow_destroy: true

  has_one :address, as: :addresseable
  accepts_nested_attributes_for :address

  has_many :phones, as: :phonesable
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  has_many :constructions
  has_many :jacks
  has_many :spreadsheets, through: :constructions

  validates :name, presence: true
  validates :email, presence: true
  validates :document_number, presence: true
end
