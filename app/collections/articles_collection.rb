class ArticlesCollection < BaseCollection
  private

  def relation
    @relation ||= Article.includes(:owner).all
  end

  def ensure_filters
    owner_filter
    sort_filters
  end

  def sort_filters
    filter do |rel|
      case sort_field
      when 'created_at'
        rel.order(created_at: sort_order)

      else
        raise 'Invalid sort key'
      end
    end
  end

  def owner_filter
    return unless params[:owner_id]

    filter do |rel|
      rel.where(owner_id: params[:owner_id])
    end
  end
end
