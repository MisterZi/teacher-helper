class News < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presense: true
  validates :body, presense: true
end
