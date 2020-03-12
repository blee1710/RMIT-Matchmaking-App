class ApplicationController < ActionController::Base

  def hello
    render "layouts/welcome"
  end

end
