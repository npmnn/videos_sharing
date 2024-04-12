class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ActionCable.server.broadcast "notifications.#{ notification.user_id }", { message: notification.content }
  end
end
