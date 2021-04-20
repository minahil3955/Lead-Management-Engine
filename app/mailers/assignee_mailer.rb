class AssigneeMailer < ApplicationMailer
  default from: 'minahil.mustafa@devsinc.com'
  def assignment_email
    @user = params[:user]
    @phase = params[:phase]
    mail(to: @user.email, subject: 'Phase Assigned')
  end
end
