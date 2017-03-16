class CreateGhosts < ActiveRecord::Migration[5.0]
  def change
    create_table :ghosts do |t|
	    t.string   "name"
	    t.string   "still_tasty_id"
	    t.integer  "shelf_life"
	    t.boolean  "eaten"
	    t.integer  "user_id"
	    t.datetime "created_at",     null: false
	    t.datetime "updated_at",     null: false
      t.timestamps
    end
  end
end
