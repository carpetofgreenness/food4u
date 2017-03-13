class AddUserIdToKitchens < ActiveRecord::Migration[5.0]
  def change
    add_column :kitchens, :user_id, :integer
  end
end
