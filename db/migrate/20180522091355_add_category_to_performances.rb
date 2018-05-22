class AddCategoryToPerformances < ActiveRecord::Migration[5.2]
  def change
    add_column :performances, :category, :string
  end
end
