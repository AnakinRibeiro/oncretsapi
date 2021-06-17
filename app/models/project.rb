class Project < ApplicationRecord
  after_create :create_activity
  belongs_to :construction
  has_one :company, through: :construction

  has_one_attached :file

  def create_activity
    ConstructionsActivity.create(construction_id: self.construction_id, user_id: Current.user.id, activities_type_id: 2)
  end
end
