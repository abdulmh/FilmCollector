class Actor < ApplicationRecord
	# has_many method specifies a one to many relationship
	# appearances option specifies that one actor has many appearances
	# destroy causes all appearances to be destroyed when their
	# related actor is destroyed
	has_many :appearances, dependent: :destroy
	# movies option specifies that one actor has many movies
	# the through option specifies that the relationship exists
	# only through appearences 
	has_many :movies, through: :appearances
	# validates method specifies that an actor is valid only if
	# a first name and last name are present
	validates :first_name, :last_name, presence: true
end