class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :initVars
  def initVars
	@categories = Category.all
	@locations = Location.all
  end
end
