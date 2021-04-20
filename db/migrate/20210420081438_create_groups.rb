class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :group

      t.timestamps
    end
  end
end
