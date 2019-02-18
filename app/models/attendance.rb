class Attendance < ApplicationRecord
	belongs_to :attendee, class_name: "User"
	belongs_to :event
	
	after_create :confirmation_send
	after_create :new_attendee_send

	def confirmation_send
    AttendanceMailer.confirmation_email(self).deliver_now
  end
  def new_attendee_send
    AdminMailer.new_attendee_email(self).deliver_now
  end
end
