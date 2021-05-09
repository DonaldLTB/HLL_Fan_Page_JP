class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :content, presence: true
  validates :topic, presence: true
  has_many_attached :photos
end
