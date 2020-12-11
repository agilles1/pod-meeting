class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.datetime :date_time
      t.string :customer_name
      t.string :boat_name

      t.timestamps
    end
  end
end
