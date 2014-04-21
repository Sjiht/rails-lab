class TaskDirectoriesController < ApplicationController
  def index
    if session[:user_id]
      @directories = TaskDirectory.where(:userID => session[:user_id])
      @tasks = Task
    else
      redirect_to :controller => 'login', :action => 'index'
    end
  end
  
  def create
    if session[:user_id]
      @directory = TaskDirectory.new(taskDirectory_params)
      @directory.save
      redirect_to :action => 'index'
    else
       redirect_to :action => 'login'
    end
  end
 
  def destroy
    if session[:user_id]
      @directory = TaskDirectory.find(params[:id])
      @directory.destroy
      redirect_to :action => 'index'
    else
      redirect_to :action => 'login'
    end
  end

  private
    def taskDirectory_params
      params.require(:taskDirectory).permit(:userID, :directoryName)
    end
end
