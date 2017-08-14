class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :news

  validates :user, presence: true
  validates :news, presence: true
  validates :body, presence: true
end
