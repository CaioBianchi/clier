class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tools, through: :favorites

  has_one_attached :avatar

  validates :email_address, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def initials
    "#{first_name&.first}#{last_name&.first}".upcase
  end
end
