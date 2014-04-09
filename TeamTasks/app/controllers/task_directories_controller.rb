class TaskDirectoriesController < ApplicationController
  def index
    @directories = TaskDirectory.all
    @tasks = Task
  end
  
  def create
    @directory = TaskDirectory.new(taskDirectory_params)
    @directory.save
    redirect_to :action => 'index'
  end
  
  def show
    @directory = TaskDirectory.find(params[:id])
  end
  
  private
    def taskDirectory_params
      params.require(:taskDirectory).permit(:facebookID, :directoryName)
    end
end
