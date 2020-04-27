class WorkersController <ApplicationController
    def index
        @worker= Worker.all
    end

    def new
        @worker= Worker.new
    end
    def create
        @worker = Worker.new(worker_params)
        if  @worker.save
            flash[:success]= "You have successully registered your Business with us!"
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
    def woker_params
        params.require(:worker).permit(:name, :last_name, :phone, :post_code, :email, :business, :business_type)
    end

end
