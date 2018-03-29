class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  def new
    byebug
    @person = Person.new
  end
    
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, alert: exception.message
  end
end