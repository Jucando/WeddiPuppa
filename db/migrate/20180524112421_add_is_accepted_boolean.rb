class AddIsAcceptedBoolean < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :is_accepted, :boolean
  end
end
