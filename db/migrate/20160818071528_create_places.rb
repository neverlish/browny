class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :latitude
      t.integer :longitude
      t.references :city

      t.timestamps
    end
  end
end
