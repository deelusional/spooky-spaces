class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added(comment)
  	@space = comment.space
  	@space_owner = @space.user

  	mail(to: @space_owner.email, subject: "A comment has been added to #{@space.name}")
  end

end
