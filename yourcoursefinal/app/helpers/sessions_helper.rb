module SessionsHelper
  def log_in(coordinator)
    session[:coordinator_id] = coordinator.id
  end
	
  def current_coordinator
    @current_coordinator ||= Coordinator.find_by(id: session[:coordinator_id])
  end

  def logged_in?
    !current_coordinator.nil?
  end
	
	def log_out
    session.delete(:coordinator_id)
	session.delete(:coordinator_username)
    @current_coordinator = nil
  end
end
