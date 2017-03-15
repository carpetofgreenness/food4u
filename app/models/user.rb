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
		kitchen_sorted = kitchen_unsorted.sort_by {|food| food.expiration_date}
	end

end
