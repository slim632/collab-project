class PlaylistsController < ApplicationController
  inherit_resources

  def create
    create! do |format|
      format.html { redirect_to collection_path }
    end
  end

  protected

  def permitted_params
    params.permit(playlist: [:title])
  end
end
