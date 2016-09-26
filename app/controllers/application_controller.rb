###############################################################################
#application_controller.rb
###############################################################################

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #If someone tries to access the admin without authorisation
  #then we redirect to the home page
  protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url
  end
end
