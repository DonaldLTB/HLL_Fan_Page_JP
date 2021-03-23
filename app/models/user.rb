class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :given_reviews, source: :reviews, foreign_key: :reviewer_id
  has_many :received_reviews, source: :reviews, foreign_key: :user_id
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # validate :validate_username
  # testing u
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
