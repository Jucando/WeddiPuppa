class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :date
      t.string :location
      t.references :performance, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
