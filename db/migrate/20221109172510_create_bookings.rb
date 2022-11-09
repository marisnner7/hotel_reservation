class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :checkin_date
      t.date :checkout_date
      t.integer :booking_status
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
