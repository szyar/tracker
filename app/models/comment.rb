class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :issue

  validates :content, length: { in: 1..500 }
end
