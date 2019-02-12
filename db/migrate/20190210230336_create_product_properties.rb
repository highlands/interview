class CreateProductProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :product_properties do |t|
      t.string :value, limit: 255
      t.references :product, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
