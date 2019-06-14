# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(category: "家賃")
Category.create(category: "水道光熱費")
Category.create(category: "食費")
Category.create(category: "交通費")
Category.create(category: "衣類")
Category.create(category: "日用品")
Category.create(category: "教育医療")
Category.create(category: "レジャー")
Category.create(category: "保険")
Category.create(category: "通信費")
Category.create(category: "投資")
Category.create(category: "書籍")
Category.create(category: "美容")
Category.create(category: "スポーツ")
Category.create(category: "定期購読")

IncomeCategory.create(category: "給与")
IncomeCategory.create(category: "賞与")
IncomeCategory.create(category: "投資")
IncomeCategory.create(category: "副業")

