class AddPictureToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :picture, :string
  end
end
