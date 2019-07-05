class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
	@coordinators = Coordinator.all
  end
  
  def new
    @category = Category.new
	flash[:notice] = ''
  end
  
  def index
    @category = Category.new
	flash[:notice] = ''
  end
  
  def create
	@category = Category.new(category_params)
 
	if @category.save
	  flash[:notice] = 'Successfully create new category'
	  redirect_to courses_path
	else
	  flash[:notice] = ''
	  render :new
	end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
