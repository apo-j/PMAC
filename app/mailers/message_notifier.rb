class MessageNotifier < ActionMailer::Base
  default from: "PMAC <jiyuny@yahoo.fr>", to: "PMAC client contact"

  def received(message)
    @message = message
    mail from: @message.email
  end
end
