class AddNameToClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :yoga_classes, :name, :string
  end
end
