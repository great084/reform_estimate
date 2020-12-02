# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Userデータ
users_params = [ 
  {email: 'test@example.com', nickname: 'test_user', password: 'password'},
  {email: 'test2@example.com', nickname: 'test_user', password: 'password'},
  {email: 'test3@example.com', nickname: 'test_user', password: 'password'},
  {email: 'test4@example.com', nickname: 'test_user', password: 'password'},
]

User.create(users_params)

# Categoryデータ
user = User.find_by(email: 'test@example.com')
categories_params = [
  {name: '仮設工事'},
  {name: '軽鉄・木・ボード工事'},
  {name: '建具工事'},
  {name: '塗装工事'},
  {name: '内装工事'},
  {name: '外部工事'},
  {name: '電気設備工事'},
  {name: '給排水設備工事'},
  {name: '解体工事'},
]

user.categories.create(categories_params)


# PriceTableデータ
category1 = Category.find_by(name: '塗装工事')
price_tables1_params = [
  {item_name: '塗りつぶし塗装', specification: '建具　現場塗装', unit: '式', unit_price: 120000},
  {item_name: '運搬搬入費', specification: nil, unit: '式', unit_price: 5000},
]

category1.price_tables.create(price_tables1_params)

category2 = Category.find_by(name: '内装工事')
price_tables2_params = [
  {item_name: '壁ビニールクロス', specification: 'SP-9901', unit: '㎡', unit_price: 1500},
  {item_name: '天井ビニールクロス', specification: 'SP-9901', unit: '㎡', unit_price: 1600},
  {item_name: 'タイル貼り', specification: 'TL-46031', unit: '式', unit_price: 32000},
  {item_name: '運搬搬入費', specification: nil, unit: '式', unit_price: 15000},
]

category2.price_tables.create(price_tables2_params)

# Estimateデータ
estimates_params = [
  {subject: '見積サンプル1', customer_name: 'ホンダ'},
  {subject: '見積サンプル2', customer_name: '田口'},
  {subject: '見積サンプル3', customer_name: 'こんどう太郎'},
]

user.estimates.create(estimates_params)

# EstimateCategoryデータ
estimate1 = Estimate.find_by(subject: '見積サンプル1')
estimate_categories_params = [
  {category_id: category1.id, name: category1.name},
  {category_id: category2.id, name: category2.name},
]

estimate1.estimate_categories.create(estimate_categories_params)

# EstimateDetailデータ
estimate1 = Estimate.find_by(subject: '見積サンプル1')
estimate_category1 = EstimateCategory.find_by(estimate_id: estimate1.id, category_id: category1.id)
pt1 = PriceTable.find_by(category_id: category2.id, item_name: '壁ビニールクロス', specification: 'SP-9901')
pt2 = PriceTable.find_by(category_id: category2.id, item_name: '天井ビニールクロス', specification: 'SP-9901')
pt3 = PriceTable.find_by(category_id: category2.id, item_name: 'タイル貼り', specification: 'TL-46031')
pt4 = PriceTable.find_by(category_id: category2.id, item_name: '運搬搬入費', specification: nil)

estimate_details_params = [
  {price_table_id: pt1.id, estimate_category_id: pt1.category_id, item_name: pt1.item_name, specification: pt1.specification, unit: pt1.unit, unit_price: pt1.unit_price, quantity: 1000, remark: '備品1'},
  {price_table_id: pt2.id, estimate_category_id: pt2.category_id, item_name: pt2.item_name, specification: pt2.specification, unit: pt2.unit, unit_price: pt2.unit_price, quantity: 500,  remark: '備品2'},
]

estimate_category1.estimate_details.create(estimate_details_params)
