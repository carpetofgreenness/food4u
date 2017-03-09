class CreateKitchens < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchens do |t|
      t.integer :food_id
      t.integer :shelf_life

      t.timestamps
    end
  end
end
