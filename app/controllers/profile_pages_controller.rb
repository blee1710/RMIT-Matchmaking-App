class ProfilePagesController < ApplicationController
  def requests

    @tasks = current_user.tasks
    
    render 'requests'

  end
end
