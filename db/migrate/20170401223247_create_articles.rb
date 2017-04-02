class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title,   null: false
      t.text   :content, null: false
      t.references :owner, null: false, index: true

      t.timestamps
    end

    add_index :articles, :created_at, using: :btree
  end
end
