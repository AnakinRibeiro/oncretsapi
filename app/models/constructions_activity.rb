class ConstructionsActivity < ApplicationRecord
  belongs_to :construction
  belongs_to :activities_type
  belongs_to :user
end
