class CreateUsers < ActiveRecord::Migration[7.0]
  def change
   create_table "users", id: false, force: :cascade do |t|
    t.string "uid", null: false, primary_key: true
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
    
    add_index :users, :uid, unique: true
  end
end
