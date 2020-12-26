class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturer do |t|
      t.string :name
    end
  end
end
