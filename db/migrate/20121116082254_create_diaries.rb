class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :text
      t.integer :tag_id
      t.integer :visibility
      t.integer :state

      t.timestamps
    end
  end
end
