class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.integer :yoga_class_id
      t.string :name
      t.integer :duration_secs

      t.timestamps
    end
  end
end
