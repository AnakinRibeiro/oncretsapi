class JacksUse < ApplicationRecord
  has_paper_trail
  
  belongs_to :jack
  belongs_to :spreadsheet
  
end
