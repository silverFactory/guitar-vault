class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :model
      t.string :type
      t.integer :user_id
      t.integer :manufacturer_id
    end
  end
end
