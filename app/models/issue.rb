class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :summary, length: { in: 6..60 }
  validates :detail, length: { in: 6..3000 }
  validates :issue_type, presence: true
  validates :priority, presence: true
  validates :assigned_person, presence: true
  validates :status, presence: true

  enum priority: { Low: 0, Medium: 1, High: 2, Urgent: 3 }
  $statuses = ['Assigned', 'Doing', 'Done']

end
