class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :tagger, polymorphic: true, index: true, null: false
      t.references :article, index: true, null: false

      t.timestamps
    end
  end
end
