class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :still_tasty_id
      t.integer :shelf_life

      t.timestamps
    end
  end
end