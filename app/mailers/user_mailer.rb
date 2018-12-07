class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'


  def order_email(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: order.id)
  end
end
