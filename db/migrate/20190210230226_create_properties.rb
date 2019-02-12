class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name, limit: 255

      t.timestamps
    end
    add_index :properties, :name, unique: true
  end
end
