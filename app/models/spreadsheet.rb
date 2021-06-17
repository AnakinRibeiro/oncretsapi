class Spreadsheet < ApplicationRecord
  after_create :create_activity

  has_paper_trail
  
  belongs_to :construction
  has_many :jacks_uses
  has_many :cables
  has_many :jacks, through: :jacks_uses
  has_many :elongations, through: :cables

  validates :name, presence: true

  def create_activity
    ConstructionsActivity.create(construction_id: self.construction_id, user_id: Current.user.id, activities_type_id: 1)
  end
end
