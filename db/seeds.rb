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
Category.create(name: "减脂课程")
Category.create(name: "增肌课程")
Category.create(name: "塑形训练")
Category.create(name: "下半身雕塑")
Category.create(name: "骨盆前倾")
Category.create(name: "驼背")
Category.create(name: "哑铃")
Category.create(name: "杠铃")
Category.create(name: "训练垫")
Category.create(name: "弹力带")
Category.create(name: "上衣")
Category.create(name: "训练背心")
Category.create(name: "束口长裤")
Category.create(name: "MYPROTEIN")
Category.create(name: "MUSCLEPHARM")
Category.create(name: "MuscleTech")
Category.create(name: "ON")
Category.create(name: "PROTEINBROWNIE")
Category.create(name: "PROTEINCOOKIE")
