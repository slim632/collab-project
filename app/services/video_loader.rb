class VideoLoader
  INITIAL_PAGE = 1

  def run
    que = [INITIAL_PAGE]

    while page = que.pop
      data = provider.list(page: page)

      process(data['videos'])

      que.push(page + 1) if data['meta']['total'] > page
    end
  end

  private

  def process(videos)
    videos.each do |video|
      VideoBuilderJob.perform_later(video)
    end
  end

  def provider
    @provider ||= Youtube::Provider.new
  end
end
