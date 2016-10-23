class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.where(:user_id => session[:user_id])

  end

  def create
    @params = params
    @task = Task.new
    @task.user_id = session[:user_id]
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]

    @task.is_complete = (params[:task][:is_complete] == "1")
    puts "what is complete? #{params[:task][:is_complete]}"

    @task.save
    # puts @task.valid?

    redirect_to action: "index"
    # @path = "update"
  end

  def show
    @task = Task.find(params[:id].to_i)
    return render :status => :forbidden unless has_access?(@task)
  end

  def new
    @task = Task.new
    @task.user_id = session[:user_id]
  end

  def edit
    @task = Task.find(params[:id].to_i)
    return render :status => :forbidden unless has_access?(@task)
  end

  def update
    @task = Task.find(params[:id].to_i)

    return render :status => :forbidden unless has_access?(@task)

    @task.title = params[:task][:title]
    @task.description = params[:task][:description]

    @task.is_complete = (params[:task][:is_complete] == "1")
    puts "what is complete? #{params[:task][:is_complete]}"

    @task.save

    redirect_to action: "index"
  end

  def complete
    @task = Task.find(params[:id].to_i)
    return render :status => :forbidden unless has_access?(@task)

    @task.is_complete = true
    @task.save

    redirect_to action: "index"
  end

  def destroy
    @task = Task.destroy(params[:id].to_i)
    return render :status => :forbidden unless has_access?(@task)

    redirect_to action: "index"
  end

  private
   def post_params
     params.require(:task).permit(:title, :description)
   end

   def authenticate_user!
     unless session[:user_id]
       # not authenticated
       # stop the request and redirect user to login page
       redirect_to controller: "sessions", action: "index"
     end
   end

   def has_access?(task)
     if task.user_id != session[:user_id]
       # user is attempting to show task not belong to them
       # return HTTP forbidden
       return false
     end

     return true
   end
end
