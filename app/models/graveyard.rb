class Graveyard < ApplicationRecord
	belongs_to :ghost

	def self.make_table

		data_table = []
		total = 0
		eaten = 0

		(Graveyard.first.created_at.to_date..Graveyard.last.created_at.to_date).each do |date|
			p date
			on_that_day = Graveyard.where("created_at >= ? and created_at <= ?", date.beginning_of_day, date.end_of_day)
			# p on_that_day
			total += on_that_day.count
			eaten += Graveyard.where("created_at >= ? and created_at <= ? and eaten = ?", date.beginning_of_day, date.end_of_day, true).count
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