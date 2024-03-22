class UserMailer < ApplicationMailer
include SendGrid
    def welcome_email
        attachments['Celebration.jpg'] = File.read('/home/navyabajpai/Downloads/Celebration.jpg')

        mail(from: 'nitin.gaurav@reddoorz.com', to: 'navya.bajpai@reddoorz.com' , subject: 'Welcome Reddoorz', cc: 'nitin.gaurav@reddoorz.com')
    end
    def welcome_user(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our Blog!')
    end
    def update_notification(user)
    @user = user
    mail(to: @user.email, subject: 'Update Notification')
    end

end