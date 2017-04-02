class CreateSubTags < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_tags do |t|
      t.string :name, null: false, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
