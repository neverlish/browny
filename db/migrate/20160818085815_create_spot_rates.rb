class CreateSpotRates < ActiveRecord::Migration[5.0]
  def change
    create_table :spot_rates do |t|
      t.references :spot, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :alpha
      t.integer :bravo
      t.integer :charlie
      t.integer :delta

      t.timestamps
    end
  end
end
