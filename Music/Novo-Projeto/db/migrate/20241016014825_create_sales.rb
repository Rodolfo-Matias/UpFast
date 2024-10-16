class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :purchaser_name
      t.string :item_description
      t.decimal :item_price, precision: 10, scale: 2
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name
      t.references :upload, foreign_key: true

      t.timestamps
    end
  end
end
