class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.references :place, foreign_key: true
      t.column :category, :integer, null: false

      t.timestamps
    end
  end
end
