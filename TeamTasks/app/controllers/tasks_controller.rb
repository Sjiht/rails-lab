class TasksController < ApplicationController
  def index
    #
  end
  
  def create
    if session[:user_id]
      # create a new task
      @task = Task.new(task_params)
      @task.save
      
      # redirect to the overview page
      redirect_to :controller => 'task_directories', :action => 'index'
    else
      redirect_to :action => 'login'
    end
  end
  
  def show
    if session[:user_id]
      # show a single task
      taskdirectoryID = Task.find(params[:id]).directoryID
      directory = TaskDirectory.where(:id => taskdirectoryID).where(:userID => session[:user_id]).first
      @task = Task.where(:directoryID => directory.id).where(:id => params[:id]).first
    else
      redirect_to :action => 'login'
    end
  end
  
  def edit
    if session[:user_id]
      # getting all the attributes to display on the edit page
      @task = Task.find(params[:id])
    else
      redirect_to :action => 'login'
    end  
  end
  
  def update
    if session[:user_id]
      @task = Task.find(params[:id])
      # updating the task with the correct parameters
      if @task.update(params[:task].permit(:taskName, :taskContent, :taskDate, :taskCompleted))
        redirect_to :controller => 'task_directories', :action => 'index'
      else
        render 'edit'
      end
    else
      redirect_to :action => 'login'
    end
  end
  
  def destroy
    if session[:user_id]
      # deleting a task
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to :controller => 'task_directories', :action => 'index'
    else
      redirect_to :action => 'login'
    end
  end
  
  private
    def task_params
      params.require(:task).permit(:taskName, :directoryID, :taskDate, :taskContent, :taskCompleted)
    end

end
