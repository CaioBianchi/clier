class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tools, through: :favorites

  has_one_attached :avatar

  enum :role, { member: 0, admin: 1 }

  validates :email_address, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def initials
    "#{first_name&.first}#{last_name&.first}".upcase
  end

  def otp_secret
    super || generate_otp_secret!
  end

  def generate_otp_secret!
    secret = ROTP::Base32.random
    update_column(:otp_secret, secret) unless new_record?
    self.otp_secret = secret if new_record?
    secret
  end

  def verify_otp(code)
    totp = ROTP::TOTP.new(otp_secret, issuer: 'CLIer')
    totp.verify(code, drift_behind: 15)
  end

  def otp_provisioning_uri
    totp = ROTP::TOTP.new(otp_secret, issuer: 'CLIer')
    totp.provisioning_uri(email_address)
  end
end
