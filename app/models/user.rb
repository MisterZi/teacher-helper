class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :students

  validates :name, presence: true, length: { maximum: 35 }
end
