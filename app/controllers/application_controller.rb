class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  def index
    @locations = Location.all
    render :layout => 'application'
  end
end
