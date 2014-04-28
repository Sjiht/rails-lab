class TaskDirectoryUsersController < ApplicationController
  def index
  end
  
  def new
    # display all the current added users on the page
    @directoryUsers = TaskDirectoryUser.where(:directoryID => params[:id])
    @users = User.all
  end
  def create
    if session[:user_id]
      # adding a user on name to share a directory with
      userID = User.where(:name => taskDirectoryUser_params[:name]).first.id
      directoryUser = TaskDirectoryUser.new(:userID => userID, :directoryID => taskDirectoryUser_params[:directoryID])
      directoryUser.save
      
      # refresh the page after adding a new user
      redirect_to :action => 'new', :id => directoryUser.directoryID
    else
       redirect_to :action => 'login'
    end
  end
  
  def destroy
    if session[:user_id]
      # remove a user from a shared directory
      directoryUser = TaskDirectoryUser.find(params[:id])
      directoryUser.destroy
      
      # refresh the page after removing a user
      redirect_to :action => 'new'
    else
      redirect_to :action => 'login'
    end
  end
  
  private
    def taskDirectoryUser_params
      # check for the correct parameters
      params.require(:taskDirectoryUser).permit(:name, :directoryID)
    end
end
