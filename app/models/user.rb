class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :works, through: :project_members,  source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
