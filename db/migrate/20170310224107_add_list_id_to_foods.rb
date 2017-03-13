class AddListIdToFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :list_id, :integer
  end
end
