require 'rails_helper'

RSpec.describe NotificationSenderJob, type: :job do
  describe "#perform" do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user) }
    let!(:user3) { FactoryBot.create(:user) }
    let(:video) { FactoryBot.create(:video, user: user1) }

    before { allow_any_instance_of(Video).to receive(:send_notifications_to_users) }

    it "creates notifications for each user" do
      expect {
        NotificationSenderJob.perform_now(video)
      }.to change(Notification, :count).by(2)
    end
  end
end

