class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :type
      t.references :performance, foreign_key: true

      t.timestamps
    end
  end
end
