class AddKitchenIdToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :kitchen_id, :integer
  end
end
