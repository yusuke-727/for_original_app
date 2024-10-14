class User < ApplicationRecord
  has_many :event_users
  has_many :events, through: :event_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
