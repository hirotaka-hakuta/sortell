class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :group_id
      t.boolean :is_activ

      t.timestamps
    end
  end
end
