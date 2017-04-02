class IndexArticleTitleAndContent < ActiveRecord::Migration[5.0]
  def up
    enable_extension :pg_trgm

    execute '
      CREATE INDEX articles_on_title_idx ON articles USING gin (title gin_trgm_ops);
      CREATE INDEX articles_on_content_idx ON articles USING gin (content gin_trgm_ops);
    '
  end

  def down
    execute 'DROP INDEX articles_on_title_idx; DROP INDEX articles_on_content_idx;'
    disable_extension :pg_trgm
  end
end
