class CreateYogis < ActiveRecord::Migration[6.0]
  def change
    create_table :yogis do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
