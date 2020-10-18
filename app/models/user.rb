class User < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :projects, through: :project_members, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email = email.downcase }
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true

  def self.find_by_email(email)
    user = find_by(email: email)
    user
  end

end
