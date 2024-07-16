class VideoBuilderJob < ActiveJob::Base
  queue_as :default

  def perform(data)
    video = VideoBuilder.build_from(data)

    if video.valid?
      video.save
    else
      Rails.logger.error "Video could not be created. #{video.errors.messages}"
    end
  end
end
