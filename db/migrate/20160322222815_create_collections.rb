class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :tag
      t.integer :start_date
      t.integer :end_date

      t.timestamps null: false
    end
  end
end
