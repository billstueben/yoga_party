class CreateYogaClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :yoga_classes do |t|
      t.integer :yogi_id
      t.string :duration_secs
      t.boolean :public_to_all

      t.timestamps
    end
  end
end
