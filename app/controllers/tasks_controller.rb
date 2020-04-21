class TasksController < ApplicationController
    def index
        @tasks= Task.all
    end 
    def new
        @tasks= Task.new
    end 

    def create
        @tasks = Task.new(tasks_params)
        if  @tasks.save
            flash[:success]= "You have successully registerd your Business with us!"
            redirect_to root_path
        else
            render 'new'
        end 
    end 

    private 
    def tasks_params
        params.require(:task).permit(:title, :description, :skills)
    end 
end 