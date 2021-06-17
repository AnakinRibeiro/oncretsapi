class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  belongs_to :company

  has_one :phone, as: :phonesable
  has_many :roles_assignments
  has_many :roles, through: :roles_assignments
end
