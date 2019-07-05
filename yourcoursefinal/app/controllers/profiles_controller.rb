class ProfilesController < ApplicationController
  def index
    @coordinator = current_coordinator
  end
end
