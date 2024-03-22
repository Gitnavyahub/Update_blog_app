class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_email_confirmation
  after_update :send_update_notification

  private

  def send_email_confirmation
    UserMailer.welcome_user(self).deliver_now
  end

  def send_update_notification
    UserMailer.update_notification(self).deliver_now
  end

  validates :first_name, :last_name, presence: true

  enum role: {user: 0, admin: 1, moderator: 2}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable
  

  has_many :articles, dependent: :destroy
  has_one_attached :avatar
  has_many :comments, dependent: :destroy
  
  



  

end
