class CreateAmps < ActiveRecord::Migration[5.2]
  def change
    create_table :amps do |t|
      t.string :name
      t.string :type
      t.integer :watts
      t.integer :channels
      t.integer :num_speakers
      t.integer :speaker_size
      t.integer :user_id
      t.integer :manufacturer_id
    end
  end
end
