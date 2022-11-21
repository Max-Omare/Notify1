class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mailer[:from_email]
  layout 'mailer'
end
