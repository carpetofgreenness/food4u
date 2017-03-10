class Food < ApplicationRecord
	belongs_to :user
	has_one :list, :kitchen
end
