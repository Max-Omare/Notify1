class AlertMailer < ApplicationMailer
  def new_alert_email(user)
    @alert = params[:alert]

    mail(to: user.email, subject: @alert.title)
  end
end
