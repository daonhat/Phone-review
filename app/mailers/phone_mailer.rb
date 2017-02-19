class PhoneMailer < ApplicationMailer
  default from: 'xoankhongphaixoan1@gmail.com'

  def new_phone user
    @user = user
    # byebug
    mail to: user.email, subject: "Have a new phone in site"
  end
end
