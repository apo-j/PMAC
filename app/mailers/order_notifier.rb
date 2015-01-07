class OrderNotifier < ActionMailer::Base
  default from: "PMAC <ijiyun.yang@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'PMAC Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'PMAC Store Order Shipped'
  end


  def contact(message)

  end

  def send_token(token, user, hostname)
    @hostname = hostname
    @token = token
    @user = user
    mail to: @user.login, subject: 'Modifier mot de passe'
  end
end
