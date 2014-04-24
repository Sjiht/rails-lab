class TaskDirectoryUsersController < ApplicationController
  def index
    
  end
  
  def new
    @directoryUsers = TaskDirectoryUser.where(:directoryID => params[:id])
    @users = User.all
  end
  def create
    if session[:user_id]
      userID = User.where(:name => taskDirectoryUser_params[:name]).first.id
      directoryUser = TaskDirectoryUser.new(:userID => userID, :directoryID => taskDirectoryUser_params[:directoryID])
      directoryUser.save
      #render :text => taskDirectoryUser_params[:name]
      redirect_to :action => 'new', :id => directoryUser.directoryID
    else
       redirect_to :action => 'login'
    end
  end
  
  def destroy
    if session[:user_id]
      directoryUser = TaskDirectoryUser.find(params[:id])
      directoryUser.destroy
      redirect_to :action => 'new'
    else
      redirect_to :action => 'login'
    end
  end
  
  private
    def taskDirectoryUser_params
      params.require(:taskDirectoryUser).permit(:name, :directoryID)
    end
end
