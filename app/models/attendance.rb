class Attendance < ApplicationRecord
  after_create :new_attendance_send

  belongs_to :user
  belongs_to :event

  def new_attendance_send
    AttendanceMailer.new_attendance_email(self.event.admin).deliver_now
  end
end
