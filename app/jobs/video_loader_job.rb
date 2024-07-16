class VideoLoaderJob < ActiveJob::Base
  queue_as :default

  def perform
    VideoLoader.new.run
  end
end
