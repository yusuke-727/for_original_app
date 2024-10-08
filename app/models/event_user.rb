class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event_id, presence: true
  validates :user_id, presence: true

  #validates :answer, inclusion: { in: ['参加', '不参加', '未'] }, allow_nil: true
end
