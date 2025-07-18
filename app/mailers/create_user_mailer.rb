# frozen_string_literal: true

class CreateUserMailer < ApplicationMailer
  def send_email(email)
    mail to: email, subject: 'Welcome to Tweets!'
  end
end
