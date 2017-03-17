class Ghost < ApplicationRecord
	belongs_to :user
	has_many :graveyards, dependent: :destroy
end
