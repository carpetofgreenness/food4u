class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :foods, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


	def list
		self.foods.where(purchased: false)
	end

	def kitchen
		kitchen_unsorted = self.foods.where(purchased: true)
		if kitchen_unsorted.length > 0
			kitchen_sorted = kitchen_unsorted.sort_by {|food| food.expiration_date}
		end
	end

	def expires_today
		today = []
		self.kitchen.each do |food|
			if food.expires_from_now == 0
				today << food
			end
		end

		today
	end

	def expires_tomorrow
		today = []
		self.kitchen.each do |food|
			if food.expires_from_now == 1
				today << food
			end
		end

		today
	end

	def expires_this_week
		today = []
		self.kitchen.each do |food|
			if food.expires_from_now > 1 && food.expires_from_now < 8
				today << food
			end
		end

		today
	end

	def expires_later
		today = []
		self.kitchen.each do |food|
			if food.expires_from_now > 8
				today << food
			end
		end

		today
	end	

end
