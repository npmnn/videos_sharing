class NotificationSenderJob < ApplicationJob
  queue_as :default

  def perform(video)
    video.user_ids.each do |user_id|
      Notification.create(video_id: video.id, user_id: user_id, content: "#{video.user.email}: #{video.title}")
    end
  end
end
