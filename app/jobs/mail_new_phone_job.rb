class MailNewPhoneJob < ApplicationJob
  queue_as :default

  def perform user
    PhoneMailer.new_phone(user).deliver_now
  end
end
