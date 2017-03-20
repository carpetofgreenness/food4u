class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :foods, dependent: :destroy
  has_many :ghosts, dependent: :destroy
  has_many :graveyards, dependent: :destroy

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

	def favorites
		self.ghosts.all.sort { |a,b| b.eaten-b.trashed <=> a.eaten-a.trashed }
	end

	def least_favorites
		self.ghosts.all.sort { |a,b| b.trashed-b.eaten <=> a.trashed-a.eaten }
	end

	def make_table

		data_table = []
		total = 0
		eaten = 0

		(self.graveyards.first.created_at.to_date..self.graveyards.last.created_at.to_date).each do |date|
			p date
			on_that_day = self.graveyards.where("created_at >= ? and created_at <= ?", date.beginning_of_day, date.end_of_day)
			# p on_that_day
			total += on_that_day.count
			eaten += self.graveyards.where("created_at >= ? and created_at <= ? and eaten = ?", date.beginning_of_day, date.end_of_day, true).count
			# p eaten
			# p total
			if total > 0
				percent = eaten * 100 / total
			else
				percent = 0
			end
			data_table << [ date.to_s, percent ]
		end

		data_table

	end

end
