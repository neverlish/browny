class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :city
      t.string :picture
      t.timestamps
    end
  end
end
