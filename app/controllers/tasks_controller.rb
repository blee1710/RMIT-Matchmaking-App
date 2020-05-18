class TasksController < ApplicationController
    def show
      render 'layouts/welcome'
    end

    def index
        @tasks= Task.paginate(page: params[:page], per_page: 10)
    end
    def new
        @tasks= Task.new
    end

    def create
        @tasks = Task.new(tasks_params)
        if  @tasks.valid?
            @tasks.skills.gsub!(/[\[\]\"]/, "")
            @recs = []
            @recs |= recommend_workers

            render 'workerlist'
        else
            render 'new'
        end
    end

    def assign
      @user = User.find(params[:userid])
      @task = Task.create(:title => params[:t], :phone => params[:p], :description => params[:d], :skills => params[:s], :user => @user)
      flash[:notice] = "You have successully requested #{@user.name} to complete your task! They will be in contact with you."
      redirect_to root_path
    end

    private
    def tasks_params
        params.require(:task).permit(:title, :phone, :description, skills: [])
    end

    def recommend_workers
        workers = User.all
        compatible = []
        requireSkill = @tasks.skills.split(", ")

        #changed algorithm in here, still not working ----Shotto
        workers.each do |w|

            workerSkill=w.business_type.split(", ")
            i = 0
            #compatible.append(w) if !(requireSkill & workerSkill).empty?
            requireSkill.each do |skill|
                if workerSkill.include?(skill)
                    if i==requireSkill.length()-1
                        compatible.append(w)
                    else
                        i=i+1
                        next
                    end
                else
                    break
                end
            end

        end

        return compatible
    end

end
