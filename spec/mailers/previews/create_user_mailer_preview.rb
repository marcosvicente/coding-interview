# Preview all emails at http://localhost:3000/rails/mailers/create_user_mailer
class CreateUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/create_user_mailer/send_email
  def send_email
    email = "email@email.com"
    CreateUserMailer.send_email(email)
  end

end
