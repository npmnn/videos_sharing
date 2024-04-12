require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    context 'valid' do
      it 'should allow valid YouTube links' do
        valid_links = [
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          'http://www.youtube.com/watch?v=dQw4w9WgXcQ',
          'https://youtube.com/watch?v=dQw4w9WgXcQ',
          'http://youtube.com/watch?v=dQw4w9WgXcQ',
          'www.youtube.com/watch?v=dQw4w9WgXcQ',
          'youtube.com/watch?v=dQw4w9WgXcQ',
        ]

        valid_links.each do |link|
          video = user.videos.new(link: link)
          expect(video).to be_valid
        end
      end
    end

    context 'invalid' do
      it 'should not allow invalid YouTube links' do
        invalid_links = [
          'https://www.example.com',
          'http://www.example.com',
          'https://example.com',
          'http://example.com'
        ]

        invalid_links.each do |link|
          video = user.videos.new(link: link)
          expect(video).not_to be_valid
          expect(video.errors[:link]).to include("Must be a valid YouTube link")
        end
      end
    end
  end

  describe 'after_commit callback' do
    it 'triggers NotificationSenderJob.perform_later' do
      video = FactoryBot.build(:video)
      expect(NotificationSenderJob).to receive(:perform_later).with(video)
      video.save
    end
  end
end