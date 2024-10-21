class Event < ApplicationRecord
    has_many :event_users, dependent: :destroy
    has_many :users, through: :event_users

    validates :title, presence: true
    validates :content, presence: true

    accepts_nested_attributes_for :event_users, allow_destroy: true
end
