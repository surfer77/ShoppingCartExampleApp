class AddThingsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :user_id, :integer
  end
end
