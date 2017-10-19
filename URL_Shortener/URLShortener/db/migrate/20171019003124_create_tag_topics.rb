class CreateTagTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_topics do |t|
      t.string :topic
      t.integer :user_id
      t.integer :shortenedurl_id
      t.timestamps
    end
    add_index :tag_topics, :user_id
    add_index :tag_topics, :shortenedurl_id
  end
end
