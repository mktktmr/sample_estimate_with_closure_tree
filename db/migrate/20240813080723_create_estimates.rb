class CreateEstimates < ActiveRecord::Migration[7.1]
  def change
    create_table :estimates do |t|
      t.string :title

      t.timestamps
    end
  end
end
