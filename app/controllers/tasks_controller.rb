class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @params = params
    @task = Task.new
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
  end

  def new
    @task = Task.new

  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    @task = Task.find(params[:id].to_i)

    @task.title = params[:task][:title]
    @task.description = params[:task][:description]

    @task.is_complete = (params[:task][:is_complete] == "1")
    puts "what is complete? #{params[:task][:is_complete]}"

    @task.save

    redirect_to action: "index"
  end

  def complete
    @task = Task.find(params[:id].to_i)
    @task.is_complete = true
    @task.save

    redirect_to action: "index"
  end

  def destroy
    @task = Task.destroy(params[:id].to_i)
    redirect_to action: "index"
  end

  private
   def post_params
     params.require(:task).permit(:title, :description)
   end
end
