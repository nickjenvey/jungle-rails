class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def confirmation_email(params)
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: "Order Confirmation for Order #{@order.id}")
  end
end
