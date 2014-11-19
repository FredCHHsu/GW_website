class UserMailer < ActionMailer::Base
  default from: "service@guestwhat2014.com"
  def welcome_email(user)
    @user = user
    @url  = 'http://gw-website.dev/users/sign_in'
    mail(to: @user.email, subject: '歡迎來到好客網 Welcome to GuestWhat')
  end
  def join_email(meal, user)
    @meal = meal
    @user = user
    mail(to: @meal.owner.email, subject: "歡迎來到好客網 Welcome to GuestWhat")
  end
  def notify(params)
    @params = params
    mail(to: 'fred.c.h.hsu@gmail.com', subject: "付款訊息!")
  end
end
