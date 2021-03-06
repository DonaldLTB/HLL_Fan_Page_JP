class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  # validate :validate_username
  # testing u
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: true
  validates :steam_name, presence: true
  validates :role, presence: true
  validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true
  validate :validate_username

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  attr_writer :login

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
