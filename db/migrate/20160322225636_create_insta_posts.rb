class CreateInstaPosts < ActiveRecord::Migration
  def change
    create_table :insta_posts do |t|
      t.integer :collection_id
      t.string :media_url
      t.string :link
      t.integer :tag_time
      t.string :media_type

      t.timestamps null: false
    end
  end
end
