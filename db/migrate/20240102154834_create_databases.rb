class CreateDatabases < ActiveRecord::Migration[7.1]
  def change
    create_table :databases do |t|
      t.string :name, null: false
      t.integer :table_count, null: false, default: 0
      t.integer :row_count, null: false, default: 0

      t.timestamps
    end
  end
end
