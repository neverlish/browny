class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.references :place, foreign_key: true
      t.column :category, :integer, null: false
      t.string :picture
      t.float :latitude
      t.float :longitude
      t.string :address
      t.timestamps
    end
  end
end
