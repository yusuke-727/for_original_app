class User < ApplicationRecord
  GUEST_USER_EMAIL = 'guest@example.com'
  ADMIN_GUEST_USER_EMAIL = 'admin_guest@example.com'

  has_many :event_users, dependent: :destroy
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

  def self.admin_guest
      find_or_create_by!(email: ADMIN_GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー(管理者)"
      user.is_admin = true
    end
  end
end
