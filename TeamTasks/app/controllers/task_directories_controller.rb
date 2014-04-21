class TaskDirectoriesController < ApplicationController
  def index
    if session[:user_id]
      #@directories = TaskDirectory.where(:userID => session[:user_id])
      #@directories = TaskDirectory.joins(:taskDirectoryUsers).where('task_directories.userID = (?) OR task_directory_users.userID = (?)', session[:user_id], session[:user_id])
     # @directories = TaskDirectory.find_by_sql('SELECT * FROM "task_directories" WHERE "userID" = 5 )
      @directories = TaskDirectory
      .joins('LEFT JOIN task_directory_users ON task_directory_users.userID = task_directories.userID')
      .where('task_directories.userID = (?) AND task_directory_users.userID = (?)', session[:user_id], session[:user_id])
      .select('task_directories.*')
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
