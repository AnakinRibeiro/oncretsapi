class User < ApplicationRecord
  has_paper_trail
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable#, :confirmable

  belongs_to :company

  has_one :phone, as: :phonesable
  belongs_to :role

  validates :role, presence: true
  validates :name, presence: true
end
