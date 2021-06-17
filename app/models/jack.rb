class Jack < ApplicationRecord
  has_paper_trail
  
  belongs_to :company
  has_many :jacks_uses

  validates :identification, presence: true
  validates :name, presence: true
  
end
