class SavedController < ActionController::Base
  require 'securerandom'
  def index 
    list
  end
 
  def list

    if cookies.permanent[:unique].blank?
      cookies.permanent[:unique] = SecureRandom.urlsafe_base64(20)
    end
    
    @saved = Saved.find_by_sql("SELECT * FROM Saveds, Courses WHERE Saveds.cookieID = '#{cookies[:unique]}' AND Courses.id == Saveds.vakID")
    

  end  
  
  def add
      saved = Saved.find_or_create_by_cookieID_and_vakID(:cookieID => cookies[:unique], :vakID => params[:vakID])
      saved.save
      redirect_to '/course/list'
  end
  
  def delete
    delete = Saved.where(:cookieID => cookies[:unique], :vakID => params[:vakID]).destroy_all
    redirect_to '/saved/list'
  end
  
end