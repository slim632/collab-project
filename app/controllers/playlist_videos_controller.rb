class PlaylistVideosController < ApplicationController
  inherit_resources
  belongs_to :playlist, optional: true

  def create
    create! do |format|
      format.html { redirect_to root_path, notice: 'Video has been added to the playlist.' }
    end
  end

  def destroy
    destroy! { parent_path(parent) }
  end

  protected

  def permitted_params
    params.permit(playlist_video: [:playlist_id, :video_id])
  end
end
