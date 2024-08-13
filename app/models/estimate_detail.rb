class EstimateDetail < ApplicationRecord
  has_closure_tree order: 'order_number', numeric_order: true, dont_order_roots: true

  belongs_to :estimate
end
