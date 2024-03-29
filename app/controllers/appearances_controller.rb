class AppearancesController < ApplicationController

	# index method gets called when the appearances URL is requested
	# index method is mapped to the appearances index.html.erb
	def index
		# call all method on Actor model class.
		# all method selects all of the data in the actor table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance variable is avialable to appearances index.html.erb.
		@actors = Actor.all
		# call all method on Movie model class.
		# all method selects all of the data in the movie table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance variable is avialable to appearances index.html.erb.
		@movies = Movie.all
		return @actors, @movies
	end

	# create methid ets called when the Create button is pushed on the
	# appearances index.html.erb
	def create
		# call constructor of Appearance model class giving it the
		# actor id and movie id parameters input in the appearance
		# index.html.erb
		# constructor creates Appearance model object which is stored
		# in variable
		appearance = Appearance.new(appearance_params)
		# call save method on Appearance object
		# save metod inserts the data in the Appearance model object
		# into the appearance table
		if appearance.save
			# if the save method succeeds, request the actors URL
			# which will rendor the actors index.html.erb in the browser
			redirect_to "/actors"
		else
			# get full messages associated with errors
			# store them in a Rails flash object named errors so that
			# the full message may be displayed in the appearances index.html.erb
			flash[:errors] = appearance.errors.full_messages
			# if the save method succeeds, request the appearances/new URL
			# which will rendor the appearances index.html.erb in the browser
			redirect_to "/appearances/index"
		end
	end

	private
	def appearance_params
		# params in a Rails object that gets the specified request
		# parameters 
		params.require(:appearance).permit(:actor_id, :movie_id)
	end
end