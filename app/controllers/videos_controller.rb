class VideosController < ApplicationController
  before_action :authenticate_user!

  def create
    video_info = VideoInfo.new(video_params[:link])

    @video = current_user.videos.new
    @video.uid = video_info.video_id
    @video.link = video_params[:link]
    @video.title = video_info.title
    @video.author = video_info.author

    if video_info.available? && @video.save
      flash[:success] = "Video added successfully"
    else
      flash[:error] = "Error adding video"
    end

    redirect_to root_url
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end