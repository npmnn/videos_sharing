require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:valid_params) { { video: { link: 'https://www.youtube.com/watch?v=RKvsZiwxVDo' } } }

    let(:video_info) { instance_double('VideoInfo', video_id: 'video_id_test', title: 'video test', available?: true) }
    before do
      allow(VideoInfo).to receive(:new).and_return(video_info)
    end

    context 'when user is authenticated' do
      before do
        sign_in user
      end

      context 'with valid params' do
        it 'creates a new video' do
          expect {
            post :create, params: valid_params
          }.to change(Video, :count).by(1)
        end

        it 'sets the correct attributes for the new video' do
          post :create, params: valid_params
          new_video = Video.last

          expect(new_video.uid).to eq('video_id_test')
          expect(new_video.link).to eq(valid_params[:video][:link])
          expect(new_video.title).to_not be_nil
        end

        it 'redirects to root_url' do
          post :create, params: valid_params
          expect(response).to redirect_to(root_url)
        end

        it 'sets flash[:success]' do
          post :create, params: valid_params
          expect(flash[:success]).to eq('Video added successfully')
        end
      end

      context 'with invalid params' do
        let(:invalid_params) { { video: { link: 'invalid_url' } } }

        it 'does not create a new video' do
          expect {
            post :create, params: invalid_params
          }.to_not change(Video, :count)
        end

        it 'redirects to root_url' do
          post :create, params: invalid_params
          expect(response).to redirect_to(root_url)
        end

        it 'sets flash[:error]' do
          post :create, params: invalid_params
          expect(flash[:error]).to eq('Error adding video')
        end
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to sign_in page' do
        post :create, params: valid_params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end