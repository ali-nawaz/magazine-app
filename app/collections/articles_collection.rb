class ArticlesCollection < BaseCollection
  private

  def relation
    @relation ||= Article.includes(:owner, taggings: :tagger).all
  end

  def ensure_filters
    owner_filter
    tag_filter
    sub_tag_filter
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

  def tag_filter
    return if params[:tag_type] != Tag.name || params[:tag_name].blank?

    filter do |rel|
      rel.joins(taggings: :tag)
         .where('taggings.tagger_type = ? AND tags.name = ?', Tag.name, params[:tag_name])
    end
  end

  def sub_tag_filter
    return if params[:tag_type] != SubTag.name || params[:tag_name].blank?

    filter do |rel|
      rel.joins(taggings: :sub_tag)
         .where('taggings.tagger_type = ? AND sub_tags.name = ?', SubTag.name, params[:tag_name])
    end
  end
end
