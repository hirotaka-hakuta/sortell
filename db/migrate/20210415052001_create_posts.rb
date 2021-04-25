class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :image_id,:default => ''
      t.string :post_text

      t.timestamps
    end
  end
end
