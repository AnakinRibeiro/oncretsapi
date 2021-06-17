class Role < ApplicationRecord
    has_many :roles_assignments

    validates :name, presence: true
end
