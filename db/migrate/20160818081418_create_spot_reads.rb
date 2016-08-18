class CreateSpotReads < ActiveRecord::Migration[5.0]
  def change
    create_table :spot_reads do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
