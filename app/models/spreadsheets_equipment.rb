class SpreadsheetsEquipment < ApplicationRecord
  belongs_to :spreadsheet
  belongs_to :pump
  belongs_to :jack
end
