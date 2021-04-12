class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :r_name
      t.text :r_introduction
      t.integer :r_price
      t.string :r_adress
      t.string :r_image

      t.timestamps
    end
  end
end
