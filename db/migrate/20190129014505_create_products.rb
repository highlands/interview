class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, limit: 1024
      t.string :upc, limit: 10
      t.datetime :available_on

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :upc, unique: true
  end
end
