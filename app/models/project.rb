class Project < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user

  validates :name, length: { in: 3..20 }
  validates :description, length: { in: 5..300 }

  def invite_member(user)
    project_members.create(user: user)
  end
end
