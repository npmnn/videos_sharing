require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'after_create callback' do
    it 'triggers NotificationBroadcastJob.perform_later' do
      notification = FactoryBot.build(:notification)
      expect(NotificationBroadcastJob).to receive(:perform_later).with(notification)
      notification.save
    end
  end
end
