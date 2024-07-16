class VideoBuilder
  def self.build_from(data)
    video = Video.find_by_external_id(data['video_id']) || Video.new(external_id: data['video_id'])

    video.title = data['title']
    video.description = data['description']
    video.thumbnail_url = data['thumbnail_url']
    video.view_count = data['views']

    video
  end
end
