class TaskDirectoriesController < ApplicationController
  def index
    if session[:user_id]
      @directories = TaskDirectory.where(:userID => session[:user_id])
      @extradirnumbers= TaskDirectoryUser.where(:userID => session[:user_id])
      @dirnumbersarray = []
      @extraDirectories = []
      @extradirnumbers.each do |d|
        @dirnumbersarray << d.directoryID
      end
      @dirnumbersarray.each do |id|
          begin
            @extraDirectories << TaskDirectory.find(id)
          rescue
            @extraDirectories = @extraDirectories
          end
      end
      
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
      directory = TaskDirectory.find(params[:id])
      directory.destroy
      tasks = Task.where(:directoryID => params[:id])
      tasks.destroy_all
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
