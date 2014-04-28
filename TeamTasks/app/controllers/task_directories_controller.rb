class TaskDirectoriesController < ApplicationController
  def index
    # check if user is logged in 
    if session[:user_id]
      # define empty arrays
      @dirnumbersarray = []
      @extraDirectories = []
      
      # select all directories owned by the user
      @directories = TaskDirectory.where(:userID => session[:user_id])
      
      # select all directories shared with the user
      @extradirnumbers= TaskDirectoryUser.where(:userID => session[:user_id])
      
      # add all directorynumbers from shared directories to an array
      @extradirnumbers.each do |d|
        @dirnumbersarray << d.directoryID
      end
      
      # look for all directories shared with the user
      @dirnumbersarray.each do |id|
          begin
            @extraDirectories << TaskDirectory.find(id)
          rescue
            @extraDirectories = @extraDirectories
          end
      end
      
      @tasks = Task
      
    # else redirect to login page
    else
      redirect_to :controller => 'login', :action => 'index'
    end
  end
  
  def create
    if session[:user_id]
      # make new directory with directory parameter
      @directory = TaskDirectory.new(taskDirectory_params)
      @directory.save
      redirect_to :action => 'index'
    else
       redirect_to :action => 'login'
    end
  end
 
  def destroy
    if session[:user_id]
      # delete directory 
      directory = TaskDirectory.find(params[:id])
      directory.destroy
      
      # delete tasks that are linked with the deleted directory
      tasks = Task.where(:directoryID => params[:id])
      tasks.destroy_all
      redirect_to :action => 'index'
    else
      redirect_to :action => 'login'
    end
  end

  private
    def taskDirectory_params
      # check for correct parameters
      params.require(:taskDirectory).permit(:userID, :directoryName)
    end
end
