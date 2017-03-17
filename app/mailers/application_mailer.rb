class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  # layout 'mailer'

  def order_email(order, user)
    @user = user
    @order = order
    @url  = 'http://localhost:3000/order'
    mail(to: @user.email, subject: "Order #{@order.id} details")
  end
end
