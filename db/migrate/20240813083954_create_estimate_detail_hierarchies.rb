class CreateEstimateDetailHierarchies < ActiveRecord::Migration[7.1]
  def change
    create_table :estimate_detail_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :estimate_detail_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "estimate_detail_anc_desc_idx"

    add_index :estimate_detail_hierarchies, [:descendant_id],
      name: "estimate_detail_desc_idx"
  end
end
