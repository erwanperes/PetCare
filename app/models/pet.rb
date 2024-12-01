class Pet < ApplicationRecord
	SPECIES  = [
		"Dog",
		"Cat",
		"Rabbit",
		"Other"
	  ]
	
	  GENDERS = [
		"Male",
		"Female"
	  ]
	
	belongs_to :user
	has_many :treatments 
	has_many :measurements
	
	validates :name, presence: true
	validates :specie, presence: true, inclusion: { in: SPECIES }
	validates :gender, presence: true, inclusion: { in: GENDERS }
	validates :birth_day, presence: true
	
	validate :birth_day_cannot_be_in_the_future
	
	private
	
	def birth_day_cannot_be_in_the_future
		if birth_day.present? && birth_day > Date.today
		  errors.add(:birth_day, "can't be in the future")
		end
	end
end
