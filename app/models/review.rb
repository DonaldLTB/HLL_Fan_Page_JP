class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :reviewer, class_name: "User"
  validates :content, presence: true
  validates :reviewer_id, presence: true
end
