class PaginateCollection
  extend Forwardable

  DEFAULT_PER_PAGE = 20
  MAX_PAGES_SHOWN = 7

  def_delegators :@collection, :[], :each, :size

  def initialize(collection, page: nil, per_page: DEFAULT_PER_PAGE)
    @total_count = collection.count
    @current_page = (page || 1).to_i
    @per_page = per_page

    offset = (@current_page - 1) * per_page
    @collection = collection.limit(per_page).offset(offset)
  end

  def current_page
    @current_page
  end

  def total_pages
    @total_count / @per_page
  end

  def first_page?
    current_page == 1
  end

  def last_page?
    current_page == total_pages
  end

  def prev_page
    current_page - 1
  end

  def next_page
    current_page + 1
  end

  def visible_pages
    start_from = [1, current_page - (MAX_PAGES_SHOWN / 2)].max
    end_at = [total_pages, start_from + (MAX_PAGES_SHOWN - 1)].min
    start_from..end_at
  end
end
