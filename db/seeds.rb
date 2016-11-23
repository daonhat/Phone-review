# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create! email: "admin@gmail.com", password: "12345678",
  password_confirmation: "12345678", is_admin: true

Category.create! name: "Andoird"

Category.create! name: "IOS"

Category.create! name: "Window Phone"

Phone.create! name:"Nokia Lumia 830", os: "Windows Phone 8.1", ram: "2GB",
 screen: "IPS LCD, HD", pin: "2200 mAh", category_id: 3, memory: "16 GB",
 front_camera: "1 MP", back_camera: "10 MP", cpu: "Qualcomm Snapdragon 400 4 nhân 32-bit"

Phone.create! name:"Samsung Galaxy Note 4", os: " Android 6.0 (Marshmallow)", ram: "3GB",
 screen: 'Super AMOLED, 5.7", Quad HD', pin: "3220 mAh", category_id: 1, memory: "32 GB",
 front_camera: "3.7 MP", back_camera: "16 MP", cpu: " Exynos 5433 8 nhân"

Phone.create! name:"Sony Xperia Z2", os: "Android 4.4 (KitKat)", ram: "2GB",
 screen: 'IPS LCD, 5.2", Full HD', pin: "3220 mAh", category_id: 1, memory: "16 GB",
 front_camera: "2.2 MP", back_camera: "20.7 MP", cpu: "Qualcomm MSM8974AB"

Phone.create! name:"HTC One (M8)", os: "Android 4.4 (KitKat)", ram: "2GB",
 screen: '  Super LCD 3, 5", Full HD', pin: "2600 mAh", category_id: 1, memory: "16 GB",
 front_camera: "5 MP", back_camera: " Dual 4 UltraPixel", cpu: "Qualcomm Snapdragon 801 4 nhân 32-bit"

 Phone.create! name:"Iphone 6", os: " iOS 9", ram: "1GB",
 screen: 'LED-backlit IPS LCD, 4.7", Retina HD", Full HD', pin: "1810 mAh", category_id: 2, memory: "16 GB",
 front_camera: "1.2 MP", back_camera: "8 MP", cpu: "  Apple A8 2 nhân 64-bit"

Phone.create! name:"Iphone 5S", os: " iOS 9", ram: "1GB",
 screen: 'LED-backlit IPS LCD, 4", DVGA', pin: "1560 mAh", category_id: 2, memory: "16 GB",
 front_camera: "1.2 MP", back_camera: "8 MP", cpu: "Apple A7 2 nhân 64-bit"
