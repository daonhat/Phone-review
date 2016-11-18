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

Phone.create! name:"Iphone", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: " 2Mp", back_camera: "8 Mp"

Phone.create! name:"Andoird", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"

Phone.create! name:"Andoird-1", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-2", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-3", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-4", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-5", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-6", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-7", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-8", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoird-9", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
Phone.create! name:"Andoirdy", os: "Andoird 4.1", ram: "2GB", screen: "", pin: "3000mAh",
  front_camera: "2 Mp", back_camera: "8 Mp"
