class UserMailer < ActionMailer::Base
  default from: "guestwhat2014@gmail.com"
  def welcome_email(user)
    @user = user
    @url  = 'http://gw-website.dev/users/sign_in'
    mail(to: @user.email, subject: '歡迎來到好客網 Welcome to GuestWhat')
  end
  def join_email(meal, user)
    @meal = meal
    @user = user
    mail(to: @meal.owner.email, subject: "#{@user.name} wants your #{@meal.title}")
  end
end
