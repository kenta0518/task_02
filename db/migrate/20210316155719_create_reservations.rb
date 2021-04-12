class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :people
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
