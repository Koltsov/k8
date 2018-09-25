class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
