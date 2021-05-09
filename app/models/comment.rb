class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :reply, presence: true
  has_many_attached :photos
end
