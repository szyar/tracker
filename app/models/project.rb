class Project < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user

  validates :name, length: { in: 3..50 }
  validates :description, length: { in: 5..300 }

  def invite_member(user, roll)
    project_members.create(user: user, roll: roll)
  end
end
