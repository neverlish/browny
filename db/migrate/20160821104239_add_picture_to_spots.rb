class AddPictureToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :picture, :string
  end
end
