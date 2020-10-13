class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :summary, length: { in: 6..60 }
  validates :detail, length: { in: 6..300 }
end
