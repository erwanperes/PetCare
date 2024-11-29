class Pet < ApplicationRecord
	belongs_to :user
	
	validates :name, presence: true
	validates :specie, presence: true
	validates :gender, inclusion: { in: ['male', 'female', 'other'] }
	
	validate :birth_day_cannot_be_in_the_future
	
	private
	
	def birth_day_cannot_be_in_the_future
		if birth_day.present? && birth_day > Date.today
		  errors.add(:birth_day, "can't be in the future")
		end
	end
end
