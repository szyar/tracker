class Project < ApplicationRecord
  belongs_to :user

  validates :name, length: { in: 3..20 }
  validates :description, length: { in: 5..300 }
end
