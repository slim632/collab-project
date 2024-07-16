class VideoQueryBuilder
  def search_by_keyword(keyword)
    @keyword = keyword
  end

  def build
    base_query = Video.all.order(created_at: :desc)

    base_query = base_query.where("LOWER(title) ILIKE ?", "%#{@keyword.downcase}%") if @keyword

    base_query
  end
end
