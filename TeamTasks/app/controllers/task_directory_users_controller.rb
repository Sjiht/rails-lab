class TaskDirectoryUsersController < ApplicationController
  def index
    
  end
  
  def new
    @directoryUsers = TaskDirectoryUser.where(:directoryID => params[:id])
    @users = User.all
  end
  def create
    if session[:user_id]
      @directoryUser = TaskDirectoryUser.new(taskDirectoryUser_params)
      @directoryUser.save
      redirect_to :action => 'new', :id => @directoryUser.directoryID
    else
       redirect_to :action => 'login'
    end
  end
  
  private
    def taskDirectoryUser_params
      params.require(:taskDirectoryUser).permit(:userID, :directoryID)
    end
end
