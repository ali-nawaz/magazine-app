class BaseCollection
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def results
    @results ||= begin
      ensure_filters
      relation
      paginate
    end
  end

  def paginate
    @relation.paginate(per_page: (params[:per_page] || per_page), page: params[:page])
  end

  def sort_field
    @sort_field ||= begin
      if params[:sort]
        params[:sort].delete('-')

      else
        'created_at'
      end
    end
  end

  def sort_order
    @sort_order ||= begin
      if params[:sort] && params[:sort][0] == '-'
        'ASC'

      else
        'DESC'
      end
    end
  end

  private

  def filter
    @relation = yield(relation)
  end

  def relation
    raise NotImplementedError
  end

  def ensure_filters
    raise NotImplementedError
  end

  def per_page
    5
  end
end
