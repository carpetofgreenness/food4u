class Food < ApplicationRecord

	belongs_to :user

<<<<<<< HEAD
=======
	def shelf_life_days
		self.shelf_life/60/60/24
	end	
>>>>>>> 544ff6ba18fd01d0243805b8989673750fbc74bc
end

