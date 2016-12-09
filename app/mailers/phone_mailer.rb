class PhoneMailer < ApplicationMailer
  default from: 'daonhat123@gmail.com'

  def new_phone user
    @user = user
    mail to: user.email, subject: "Have a new phone in site"
  end
end
