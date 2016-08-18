class CreateSayings < ActiveRecord::Migration[5.0]
  def change
    create_table :sayings do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
