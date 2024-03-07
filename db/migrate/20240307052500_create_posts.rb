class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :front_cam_url
      t.string :back_cam_url
      t.string :user_uid, null: false
      t.boolean :delete_flag
      t.timestamps
    end

    add_foreign_key :posts, :users, column: :user_uid, primary_key: :uid
  end
end
