class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.boolean :availability, default: true
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
