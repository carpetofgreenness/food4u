class Food < ApplicationRecord
	belongs_to :user

	def shelf_life_days
		self.shelf_life/60/60/24
	end
	
end

