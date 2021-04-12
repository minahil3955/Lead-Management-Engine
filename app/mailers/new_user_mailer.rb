class NewUserMailer < ApplicationMailer
  default from: 'minahil.mustafa@devsinc.com'
  def send_credentails_email(user)
    @user = user
    mail(to: user.email, subject: 'New User login Credentials')
  end
end
