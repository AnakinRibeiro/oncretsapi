class Phone < ApplicationRecord
  belongs_to :phones_type
  belongs_to :phonesable, polymorphic: true

  validates :phone, presence: true
end
