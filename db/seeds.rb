# Create an EstimateDetail as shown below (the values in parentheses are the total of itself or its descendants).
#
# root (37,000)
# ├ 1 (1,000) => unit_price: 1,000, amount: 1
# ├ 2 (6,000)
# │ ├ 2-1 => unit_price: 2,000, amount: 1
# │ └ 2-2 => unit_price: 2,000, amount: 2
# └ 3 (30,000)
#   ├ 3-1 (9,000)
#   │ ├ 3-1-1 => unit_price: 3,000, amount: 1
#   │ └ 3-1-2 => unit_price: 3,000, amount: 2
#   └ 3-2 (21,000)
#     ├ 3-2-1 => unit_price: 3,000, amount: 3
#     └ 3-2-2 => unit_price: 3,000, amount: 4
#
estimate = Estimate.new(title: "EST-00001")

root = estimate.build_root_estimate_detail(title: "root")

root.append_child(EstimateDetail.new(estimate:, title: "1", unit_price: 1000, amount: 1))

detail_2 = root.append_child(EstimateDetail.new(estimate:, title: "2"))

detail_2_1 = detail_2.append_child(EstimateDetail.new(estimate:, title: "2-1", unit_price: 2000, amount: 1))
detail_2_2 = detail_2.append_child(EstimateDetail.new(estimate:, title: "2-2", unit_price: 2000, amount: 2))

detail_3 = root.append_child(EstimateDetail.new(estimate:, title: "3"))

detail_3_1 = detail_3.append_child(EstimateDetail.new(estimate:, title: "3-1"))
detail_3_1.append_child(EstimateDetail.new(estimate:, title: "3-1-1", unit_price: 3000, amount: 1))
detail_3_1.append_child(EstimateDetail.new(estimate:, title: "3-1-2", unit_price: 3000, amount: 2))

detail_3_2 = detail_3.append_child(EstimateDetail.new(estimate:, title: "3-2"))
detail_3_2.append_child(EstimateDetail.new(estimate:, title: "3-2-1", unit_price: 3000, amount: 3))
detail_3_2.append_child(EstimateDetail.new(estimate:, title: "3-2-2", unit_price: 3000, amount: 4))

estimate.save!
