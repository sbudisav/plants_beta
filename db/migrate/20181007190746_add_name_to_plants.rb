class AddNameToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :name, :string
    add_column :plants, :bionominal, :string
  end
end
