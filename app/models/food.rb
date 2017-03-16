class Food < ApplicationRecord

	belongs_to :user

	def shelf_life_days
		self.shelf_life/60/60/24
	end
	
	def expiration_date
		if purchased
			self.purchased_at + self.shelf_life_days.days
		end
	end

	def expires_from_now
		exact = (self.expiration_date - Time.now)/60/60/24
		exact.round
	end

end

