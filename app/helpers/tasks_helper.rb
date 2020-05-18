module TasksHelper
  def checked(area)
      @tasks.skills.nil? ? false : @tasks.skills.match(area)
  end
end
