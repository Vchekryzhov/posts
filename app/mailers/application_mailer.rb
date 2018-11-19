class ApplicationMailer < ActionMailer::Base
  default from: "#{ Rails.application.credentials[:mailer][:MAIL_USERNAME] }"
  layout 'mailer'
end
