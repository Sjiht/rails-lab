class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def create
   
    @task = Task.new(task_params)
    @task.save
    redirect_to :controller => 'task_directories', :action => 'index'
    
  end
  
  def show
    @tasks = Task.all
  end
  
  def edit
    #task = Task.where(:id => params[:id])
    #task.taskName = 'bla1'
    #task.taskContent = 'bla1 content'
    #task.taskCompleted = 1
    #task.save
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
   
    if @task.update(params[:task].permit(:taskName, :taskContent))
      redirect_to @task
    else
      render 'edit'
    end
  end
  
  private
    def task_params
      params.require(:task).permit(:taskName, :directoryID, :taskDate, :taskContent, :taskCompleted)
    end

end
