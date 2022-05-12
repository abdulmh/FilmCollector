class MovieratingController < ApplicationController
	# index method gets called when the movierating URL is requested
    # index method is mapped to the movierating index.html.erb
    def index
        # call all method on Movierating model class.
        # all method selects all of the data in the course2s table
        # and returns the data as an array of objects.
        # store the array of objects in an instance variable.
        # instance variable is avialable to movierating index.html.erb.
        @movierating = MovieRating.all
        return @movierating
    end

    # create method gets called when the Create button is pushed on the
    # movierating index.html.erb
    def create
        # call constructor of CourseStudent model class giving it the
        # movierating id parameters input in the movierating
        # index.html.erb
        # constructor creates CourseStudent model object which is stored
        # in variable
		movierating = MovieRating.new(movierating_params)
        # call save method on CourseStudent object
        # save metod inserts the data in the CourseStudent model object
        # into the movierating table
        if movierating.save
            # if the save method succeeds, request the movierating URL
            # which will rendor the movierating index.html.erb in the browser
            redirect_to "/movierating/show"
        else
            # get full messages associated with errors
            # store them in a Rails flash object named errors so that
            # the full message may be displayed in the movierating index.html.erb
            flash[:errors] = movierating.errors.full_messages
            # if the save method succeeds, request the movierating/new URL
            # which will rendor the movierating index.html.erb in the browser
            redirect_to "/movierating"
        end

    end
    
    private
    def roster_params
        # params in a Rails object that gets the specified request
        # parameters 
        params.require(:movierating).permit(:title_id)
    end
end