class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :foods 
  has_many :lists
  has_many :kitchens

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
