class User < ApplicationRecord
  before_save { email.downcase! }
  has_secure_password
  has_many :foods, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
