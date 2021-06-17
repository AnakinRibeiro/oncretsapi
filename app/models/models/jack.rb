class Jack < ApplicationRecord
  belongs_to :company
  has_many :jacks_uses
  
end
