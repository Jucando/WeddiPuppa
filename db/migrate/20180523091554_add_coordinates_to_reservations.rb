class AddCoordinatesToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :latitude, :float
    add_column :reservations, :longitude, :float
  end
end

