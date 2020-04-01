class ApplicationController < ActionController::Base

  def hello
    render "layouts/welcome"
  end

  # redirecting the devise login

  def after_sign_in_path_for(resource)
    profile_pages_main_path
  end 
  # this is to direct the user to the main page after logout  
  def after_sign_out_path_for(resource)
    root_path
  end 
  
end
