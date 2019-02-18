class AddIndexToAttendances < ActiveRecord::Migration[5.2]
  def change
  	add_reference :attendances, :attendee, index: true
  end
end
