class AddIndexToPictures < ActiveRecord::Migration[5.0]
  def change
  	add_index :pictures, [:imageable_type, :imageable_id]
  end
end
