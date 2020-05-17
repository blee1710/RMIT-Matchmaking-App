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
        requireSkill = @tasks.skills.split(", ")
        
        #changed algorithm in here, still not working ----Shotto
        workers.each do |w|
            
            workerSkill=w.business_type.split(", ")
            puts workerSkill
            i = 0
            #compatible.append(w) if !(requireSkill & workerSkill).empty?
            requireSkill.each do |skill|
                if workerSkill.include?(skill)
                    if i==requireSkill.length()-1
                        puts w.name
                        compatible.append(w)
                    else
                        i=i+1
                        puts i
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
