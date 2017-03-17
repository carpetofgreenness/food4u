class AddInfoToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :info, :text
  end
end
