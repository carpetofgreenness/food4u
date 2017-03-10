class Food < ApplicationRecord
	belongs_to :user
	has_one :list 
	has_one :kitchen
end
