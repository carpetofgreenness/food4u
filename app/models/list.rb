class List < ApplicationRecord
	belongs_to :user
	has_one :food
end
