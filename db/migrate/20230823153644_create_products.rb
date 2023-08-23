class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :product_name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_fee_burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :day_to_ship_id, null: false
      t.timestamps
    end
  end
end