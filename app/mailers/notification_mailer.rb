class NotificationMailer < ApplicationMailer
  def send_notification email, post_title, status
    @post_title = post_title
    @status = status
    mail(to: email, subject: "#{status} пост")
  end
end
