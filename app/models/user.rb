class User < ApplicationRecord
  GUEST_USER_EMAIL = 'guest@example.com'

  has_many :event_users
  has_many :events, through: :event_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.guest
      find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end
end
