class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :video

  after_create { NotificationBroadcastJob.perform_later(self) }
end
