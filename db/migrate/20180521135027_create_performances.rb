class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.string :title
      t.text :description
      t.string :price
      t.boolean :is_visible
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
