class CreatePoses < ActiveRecord::Migration[6.0]
  def change
    create_table :poses do |t|
      t.string :name
      t.string :picture
      t.integer :chapter_id
      t.string :tips
      t.integer :duration_secs

      t.timestamps
    end
  end
end
