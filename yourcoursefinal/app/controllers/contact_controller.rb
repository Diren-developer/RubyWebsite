class ContactController < ApplicationController
  def index
  end

  def create
    if params[:course][:feedback].nil? || params[:course][:feedback].empty?
      flash[:notice] = ""
      flash[:error] = "Feedback can't be blank"
      render:index
    else
      ContactMailer.with(feedback: params[:course][:feedback]).feedback_email.deliver_now
      flash[:notice] = 'Feedback successfully sent'
      flash[:error] = ""
      render:index
    end
  end
end
