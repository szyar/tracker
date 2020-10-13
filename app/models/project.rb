class Project < ApplicationRecord
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user

  validates :name, length: { in: 3..20 }
  validates :description, length: { in: 5..300 }
end
