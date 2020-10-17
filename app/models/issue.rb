class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :summary, length: { in: 6..60 }
  validates :detail, length: { in: 6..3000 }
  validates :issue_type, presence: true
  validates :priority, presence: true
  validates :assigned_person, presence: true
  validates :status, presence: true

  mount_uploader :image, ImageUploader

  enum priority: { Low: 0, Medium: 1, High: 2, Urgent: 3 }
  $statuses = ['Init', 'Assigned', 'Doing', 'Done']

end
