class CreateEstimateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :estimate_details do |t|
      t.string :title
      t.decimal :unit_price
      t.decimal :amount
      t.references :estimate, null: false, foreign_key: true
      t.integer :order_number
      t.bigint :parent_id

      t.timestamps
    end
  end
end
