class SavedController < ActionController::Base
  require 'securerandom'
  def index 
    list
  end
 
  def list

    # generate cookie if it doesn't exist, with 20 random characters
    if cookies.permanent[:unique].blank?
      cookies.permanent[:unique] = SecureRandom.urlsafe_base64(20)
    end
    
    # select all saved courses, based on the cookie of the user and the courseID
    @saved = Saved.find_by_sql("SELECT * FROM Saveds, Courses WHERE Saveds.cookieID = '#{cookies[:unique]}' AND Courses.id == Saveds.vakID")
    

  end  
  
  def add
      # add a course to saved if it doesnt exist
      saved = Saved.find_or_create_by_cookieID_and_vakID(:cookieID => cookies[:unique], :vakID => params[:vakID])
      saved.save
      
      # redirect the user back to the beginning
      redirect_to '/course/list'
  end
  
  def delete
    # delete a saved course
    delete = Saved.where(:cookieID => cookies[:unique], :vakID => params[:vakID]).destroy_all
    redirect_to '/saved/list'
  end
  
end