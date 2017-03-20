class CreateGraveyards < ActiveRecord::Migration[5.0]
  def change
    create_table :graveyards do |t|
      t.integer :ghost_id
      t.integer :user_id
      t.boolean :eaten

      t.timestamps
    end
  end
end
