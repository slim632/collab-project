class VideosController < ApplicationController
  def index
    @playlists = Playlist.all

    builder = VideoQueryBuilder.new
    builder.search_by_keyword(params[:keyword]) if params[:keyword]

    @videos = PaginateCollection.new(builder.build, page: params[:page])
  end

  def fetch
    VideoLoaderJob.perform_later

    redirect_to root_path, notice: 'Video Loader job has been placed into queue. Refresh page in few seconds.'
  end
end
