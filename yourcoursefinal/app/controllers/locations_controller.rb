class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
	@coordinators = Coordinator.all
  end
  
  def new
    @location = Location.new
	flash[:notice] = ''
  end
  
  def index
    @location = Location.new
	flash[:notice] = ''
  end
  
  def create
	@location = Location.new(category_params)
 
	if @location.save
	  flash[:notice] = 'Successfully create new location'
	  redirect_to courses_path
	else
	  flash[:notice] = ''
	  render :new
	end
  end
  
  private
    def category_params
      params.require(:location).permit(:name)
    end
end
