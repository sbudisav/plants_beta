class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :water_freq
      t.integer :sun_pref
      t.integer :fertilizer_freq
      t.string :description
      t.integer :temp_min
      t.integer :temp_max

      t.timestamps
    end
  end
end
