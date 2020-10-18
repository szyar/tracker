class ProjectMember < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :role, presence: true
end
