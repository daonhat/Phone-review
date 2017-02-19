# ABOUT PROJECT

This is a project for Website development subject at 9th sememter in HEDSPI project at HUST VietNam. It's a site simple smartphone review
* USER can
  + Authentication, update profile.
  + See all smartphone in website
  + Search by many condition
  + See top smartphone
  + Review smarthphone by star, max is 5 star and min is 1*
  + Comment in detail smartphone

* ADMIN can
  + Follow system with 2 chart: User per day and Phone of category
  + Manage User in system (delete , update and create new user with password is email)
  + Manage category: CRUD category
  + Manage smartphone: CRUD smartphone, when create new smartphone admin using editor

Website is deployed at: https://smartphonereview-dn-hedspi.herokuapp.com

+ Account user: usertest@gmail.com
  password user: 12345678
+ Account admin: admin@gmail.com
  password admin: 12345678

# MEMBER
* HEDSPI K57 students of HUST VietNam. Leaded and managed by daonhat (email:daonhat@gmail.com)

# INSTALL PROJECT
* Install Ruby 2.3.1
* Install Rails 5.0.0.1
* Download source code and run
+ bundle install
+ rake db:migrate
+ rake db:seed
