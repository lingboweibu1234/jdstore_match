# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "buy@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save


Category.connection
Category.create(name: "新手入门")
Category.create(name: "零基础减脂")
Category.create(name: "瑜伽")
Category.create(name: "女生热门")
Category.create(name: "体态改善")
Category.create(name: "明星课程")
Category.create(name: "腹肌训练")
Category.create(name: "活力燃脂")
Category.create(name: "力量增肌")
Category.create(name: "家庭塑形")
Category.create(name: "特约驾驶员课程")
Category.create(name: "辅助训练产品")
Category.create(name: "专业训练服饰")
Category.create(name: "健身蛋白粉")
Category.create(name: "营养食品")
Category.create(name: "私人教练")
