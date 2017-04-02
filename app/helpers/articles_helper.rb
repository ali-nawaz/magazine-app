module ArticlesHelper
  def format_taggings(taggings)
    links = []

    taggings.each do |tagging|
      tagger = tagging.tagger
      links << link_to(tagger.name, articles_path(tag_name: tagger.name, tag_type: tagger.class.name))
    end

    (links.join(', ').presence || "<em>#{t('articles.no_tags')}</em>").html_safe
  end
end
