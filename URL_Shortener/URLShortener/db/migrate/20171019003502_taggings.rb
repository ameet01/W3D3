class Taggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :shortenedurl_id
      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :shortenedurl_id
  end
end
