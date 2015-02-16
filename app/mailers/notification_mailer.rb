class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added
  	mail(to: "dtapmalai@gmail.com", subject: "A comment has been added to your spooky space")
  end

end
