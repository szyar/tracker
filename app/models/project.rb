class Project < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user
  has_many :issues, dependent: :destroy

  validates :name, length: { in: 3..50 }, uniqueness: true
  validates :description, length: { in: 5..300 }

  def invite_member(user, role)
    project_members.create(user: user, role: role)
  end
end
