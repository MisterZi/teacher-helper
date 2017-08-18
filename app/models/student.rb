class Student < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 35 }
end
