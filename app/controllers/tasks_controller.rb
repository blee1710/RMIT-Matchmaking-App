class TasksController < ApplicationController
    def index
        @tasks= Task.paginate(page: params[:page], per_page: 10)
    end
    def new
        @tasks= Task.new
    end

    def create
        @tasks = Task.new(tasks_params)
        if  @tasks.save
            @recs = []
            @recs |= recommend_workers
            render 'workerlist'
        else
            render 'new'
        end
    end

    private
    def tasks_params
        params.require(:task).permit(:title, :description, skills: [])
    end

    def recommend_workers
        workers = User.all
        compatible = []
        workers.each do |w|
          if @tasks.skills == w.business_type
            compatible.append(w)
          end
        end
        return compatible
    end

end
