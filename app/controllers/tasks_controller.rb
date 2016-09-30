class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @params = params
    @task = Task.new
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.is_complete = params[:task][:is_complete]
    @task.complete_at = params[:task][:complete_at]
    @task.save
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
    @task.is_complete = params[:task][:is_complete]
    @task.complete_at = params[:task][:complete_at]
    @task.save
  end

  def destroy
    @task = Task.destroy(params[:id].to_i)
  end

  private
   def post_params
     params.require(:post).permit(:title, :author, :body)
   end
end
