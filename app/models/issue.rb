class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :summary, length: { in: 6..60 }
  validates :detail, length: { in: 6..3000 }
  validates :type, presence: true
  validates :priority, presence: true
  validates :assigned_person, presence: true
  validates :status, presence: true

end
