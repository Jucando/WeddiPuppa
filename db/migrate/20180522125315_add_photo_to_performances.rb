class AddPhotoToPerformances < ActiveRecord::Migration[5.2]
  def change
    add_column :performances, :photo, :string
  end
end
