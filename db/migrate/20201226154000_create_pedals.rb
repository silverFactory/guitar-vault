class CreatePedals < ActiveRecord::Migration[5.2]
  def change
    create_table :pedals do |t|
      t.string :name
      t.string :effect_type
      t.string :power_supply
      t.integer :user_id
      t.integer :manufacturer_id
    end
  end
end
