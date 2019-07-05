class VotesController < ApplicationController
  def index
	if logged_in?
	  @course = Course.find(params[:id])
	  @vote = Vote.find_by(course: @course, coordinator: current_coordinator)
	  if @vote.nil?
	    @vote = Vote.new(course: @course, coordinator: current_coordinator, result: params[:vote])
		@vote.save
		flash[:notice] = 'Vote successfull'
		flash[:error] = ''
		redirect_back fallback_location: request.referer
	  else
	    flash[:notice] = ''
	    flash[:error] = 'You can only vote a course once !'
		redirect_back fallback_location: request.referer
	  end
	else
	  redirect_to coordinators_path
	end
  end
end
