class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :user_name
      t.integer :user_id
      t.string :post_image

      t.timestamps
    end
  end
end
