class Construction < ApplicationRecord
  has_paper_trail

  belongs_to :company
  has_many :addresses, as: :addresseable
  has_many :phones, as: :phonesable
  has_many :spreadsheets
  has_many :cables, through: :spreadsheets
  has_many :elongations, through: :cables
  has_many :projects
  has_many :constructions_activities
  
  has_one_attached :image

  validates :name, presence: true

  attr_accessor :cover_image_url
  attr_accessor :last_change
  attr_accessor :spreadsheet_count
  attr_accessor :cable_count
  attr_accessor :elongation_count
  attr_accessor :project_count

  default_scope { order("id DESC") }

  def cables_count
    self.spreadsheets.joins(:cables).count
  end

  def elongations_count
    self.spreadsheets.joins(:cables, :elongations).where("cables.id = elongations.cable_id").count
  end

  def projects_count
    self.projects.count
  end
end
