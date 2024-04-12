require 'rails_helper'

RSpec.describe NotificationSenderJob, type: :job do
  describe "#perform" do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user) }
    let!(:user3) { FactoryBot.create(:user) }
    let(:video) { FactoryBot.create(:video, user: user1) }

    it "creates notifications for each user" do
      expect {
        NotificationSenderJob.perform_now(@video)
      }.to change(Notification, :count).by(4) # The job is run twice due to a callback when creating the video
    end
  end
end

