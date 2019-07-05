class CoordinatorsController < ApplicationController
  def new
    @coordinator = Coordinator.new
	  flash[:notice] = ''
  end

  def edit
		@coordinator = Coordinator.find(params[:id])
		flash[:notice] = ''
	end
  
  def index
    @coordinator = Coordinator.new
	flash[:notice] = ''
  end
  
  def create
    if params[:coordinator][:type] == 'login'
      @coordinator = Coordinator.find_by(email: coordinator_params[:email].downcase)
        if @coordinator && @coordinator[:password] == coordinator_params[:password]
          log_in @coordinator
          flash[:notice] = 'Log in successfully !'
          redirect_to courses_path
        else
        @coordinator = Coordinator.new(coordinator_params)
          flash[:notice] = 'Invalid username and or password'
          render :index
        end
    else
      @coordinator = Coordinator.new(coordinator_params)
    
      if @coordinator.save
        flash[:notice] = 'Successfully signed up'
        render :index
      else
        flash[:notice] = ''
        render :new
      end
    end
  end

  def update
    @coordinator = Coordinator.find(params[:id])
    @coordinator.update(coordinator_params)
  
    if @coordinator.save
      flash[:notice] = 'Successfully edit'
      redirect_to profiles_path
    else
      flash[:notice] = ''
      render :edit
    end
  end
  
  def destroy
    log_out
	flash[:notice] = 'You have logged out !'
    redirect_to '/'
  end
  
  private
    def coordinator_params
      params.require(:coordinator).permit(:name, :email, :password)
    end
end
