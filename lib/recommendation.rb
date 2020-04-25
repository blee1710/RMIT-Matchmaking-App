module Recommendation
  def recommend_jobs # recommend jobs to a user
    task_list = Tasks.all

    recommend = []

    task_list do |current_user|
      common_tasks = current_user.skills & self.req_skill

      #add to recommend array if common tasks not nil 
  end
