class AddImageurlToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :imageurls, :string
  end
end
