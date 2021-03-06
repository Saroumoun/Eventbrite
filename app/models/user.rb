class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
	after_create :welcome_send

	has_many :event_creations, foreign_key: 'admin_id', class_name: "Event", dependent: :destroy
	has_many :event_attendances, foreign_key: 'attendee_id', class_name: "Attendance", dependent: :destroy
	has_many :events, through: :event_attendances, dependent: :destroy
  has_one_attached :profil_picture

	def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
