class Student < ApplicationRecord
  belongs_to :user

  validates :surname, presence: true, length: { maximum: 35 }
  validates :name, presence: true, length: { maximum: 35 }
  validates :birthday, presence: true
end
