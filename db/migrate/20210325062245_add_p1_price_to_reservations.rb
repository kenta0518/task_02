class AddP1PriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations,:p1_price,:integer
  end
end
