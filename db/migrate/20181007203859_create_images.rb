class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.integer :plant_id
      t.string :alt

      t.timestamps
    end
  end
end
