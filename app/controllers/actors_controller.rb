class ActorsController < ApplicationController
	# index method gets called when the actors URL is requested 
	# index method gets mapped to the actors index.html.erb.
	def index 
		# call all method on Actor model class.
		# all method selects all of the data in the actor table
		# and returns the data as an array of objects.
		# store the array of objects in an instance variable.
		# instance variable is avialable to actors index.html.erb.
		@actors = Actor.all
	end
	
	# new method gets called when the actors new URL is requested.
	# new nethod is mapped to the actors new.html.erb
	def new
	end

	# create method gets called when the Create buttion is pushed on
	# the actors new.html.erb.
	def create
		# call constructor of Actor model class giving it the
		# first name and last name parameters input in the actors
		# new.html.erb
		# constructo creates Actor model object which is stored
		# in variable
		actor = Actor.new(actor_params)
		# call save method on Acotr object
		# save metod inserts the data in the Actor model object
		# into the acotr table
		if actor.save
			# if the save method succeds, request the actors URL
			# which will rendor the actors index.html.erb in the browser
			redirect_to "/actors"
		else
			# get full messaes associated with errors
			# store them in a Rails flahs object named errors so that
			# the full message may be displayed in the actors new.html.erb
			flash[:errors] = actor.errors.full_messages
			# if the save method succeds, request the actors/new URL
			# which will rendor the actors new.html.erb in the browser
			redirect_to "/actors/new"
		end 
	end

	private
	def actor_params
		# params in a Rails object that gets the specified request
		# parameters 
		params.require(:actor).permit(:first_name, :last_name)
	end
end
