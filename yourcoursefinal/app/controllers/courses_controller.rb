class CoursesController < ApplicationController
  def index
    @courses = Course.all
		@coordinators = Coordinator.all
	end
	
	def show
		@course = Course.find(params[:id])
	end

	def edit
		@course = Course.find(params[:id])
		flash[:notice] = ''
	end
  
  def new
		@course = Course.new
		@categories = Category.all
		@locations = Location.all
		flash[:notice] = ''
  end
  
  def create
    @course = Course.new(course_params)
		if !params[:categories].nil?
			params[:categories].each do |category_id|
				@course.categories << Category.find(category_id)
			end
		end
		if !params[:locations].nil?
			params[:locations].each do |location_id|
				@course.locations << Location.find(location_id)
			end
		end
		@course.coordinator = current_coordinator
		
		if @course.save
		
			uploaded_io = params[:course][:image]
			if !uploaded_io.nil?
				filename = 'course-'+@course.id.to_s+'-'+uploaded_io.original_filename
				File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
					file.write(uploaded_io.read)
				end
				@course.image = filename
				@course.save
			end
		
			flash[:notice] = 'Successfully create new course';
			@courses = Course.all
			@coordinators = Coordinator.all
			render :index
		else
			flash[:notice] = ''
			render :new
		end
	end
	
	def update
		@course = Course.find(params[:id])
		@course.update(course_params)
		if !params[:categories].nil?
			@course.categories.each do |category|
				if !params[:categories].include?(category.id)
					@course.categories.delete(category)
				end
			end
			params[:categories].each do |category_id|
				@curCategory = Category.find(category_id)
				if !@course.categories.include?(@curCategory)
					@course.categories << @curCategory
				end
			end
		end
		if !params[:locations].nil?
			@course.locations.each do |location|
				if !params[:locations].include?(location.id)
					@course.locations.delete(location)
				end
			end
			params[:locations].each do |location_id|
				@curLocation = Location.find(location_id)
				if !@course.locations.include?(@curLocation)
					@course.locations << @curLocation
				end
			end
		end
		@course.coordinator = current_coordinator
		
		if @course.save
		
			uploaded_io = params[:course][:image]
			if !uploaded_io.nil?
				filename = 'course-'+@course.id.to_s+'-'+uploaded_io.original_filename
				File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
					file.write(uploaded_io.read)
				end
				@course.image = filename
				@course.save
			end
		
			flash[:notice] = 'Successfully edit course';
			@courses = Course.all
			@coordinators = Coordinator.all
			render :index
		else
			flash[:notice] = ''
			render :edit
		end
  end
  
  private
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :image)
    end
end
