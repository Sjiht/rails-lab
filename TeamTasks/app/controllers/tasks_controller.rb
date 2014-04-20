class TasksController < ApplicationController
  def index
    
  end
  
  def create
    if session[:user_id]
      @task = Task.new(task_params)
      @task.save
      redirect_to :controller => 'task_directories', :action => 'index'
    else
      redirect_to '/auth/facebook'
    end
  end
  
  def show
    if session[:user_id]
      taskdirectoryID = Task.find(params[:id]).directoryID
      directory = TaskDirectory.where(:id => taskdirectoryID).where(:userID => session[:user_id]).first
      @task = Task.where(:directoryID => directory.id).first
    else
      redirect_to '/auth/facebook'
    end
    
    #if @directory.directoryID == @taskid.directoryID
    #  @tasks = Task.all
    #else 
    #  render :text => 'Niet ingelogd'
    #end
  end
  
  def edit
    if session[:user_id]
      @task = Task.find(params[:id])
    else
      redirect_to '/auth/facebook'
    end  
  end
  
  def update
    if session[:user_id]
      @task = Task.find(params[:id])
      if @task.update(params[:task].permit(:taskName, :taskContent, :taskDate, :taskCompleted))
        redirect_to :controller => 'task_directories', :action => 'index'
      else
        render 'edit'
      end
    else
      redirect_to '/auth/facebook'
    end
  end
  
  def destroy
    if session[:user_id]
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to :controller => 'task_directories', :action => 'index'
    else
      redirect_to '/auth/facebook'
    end
  end
  
  private
    def task_params
      params.require(:task).permit(:taskName, :directoryID, :taskDate, :taskContent, :taskCompleted)
    end

end
