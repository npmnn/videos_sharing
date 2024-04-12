class Video < ApplicationRecord
  belongs_to :user

  has_many :notifications
  after_commit :send_notifications_to_users

  validates :link, presence: true, format: { with: /\A(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?v=([^\s&]+)\z/i,
                                             message: "Must be a valid YouTube link" }

  def user_ids
    User.where.not(id: self.user_id).ids
  end

  def send_notifications_to_users
    NotificationSenderJob.perform_later(self)
  end
end
