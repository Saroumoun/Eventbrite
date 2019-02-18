class Event < ApplicationRecord
	belongs_to :admin, foreign_key: 'admin_id', class_name: "User"
	has_many :attendances
	has_many :attendees, class_name: "User", through: :attendances

	validates :start_date, presence: true, date: { after: Proc.new { Time.now }}
	validates :duration, presence: true, numericality: {greater_than: 0, only_integer:true}
	valide :duration_is_multiple_of_five
	validates :title, presence: true, length: { in: 5..140}
	validates :description, presence: true, length: { in: 20..1000}
	validates :price, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, only_integer:true}
	validates :location, presence: true
	
	def duration_is_multiple_of_five
		errors.add(:duration, "must be a multiple of 5") unless self.duration % 5 == 0
	end

          


end
