class User < ApplicationRecord
  has_many :project_members, dependent: :destroy
  has_many :projects, through: :project_members, dependent: :destroy
  has_many :issues, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_by_email(email)
    user = find_by(email: email)
    user
  end

end
