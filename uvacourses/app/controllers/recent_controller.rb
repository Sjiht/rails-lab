class RecentController < ActionController::Base
  require 'securerandom'
  def index 
    list
  end
 
  def list
    if cookies.permanent[:unique].blank?
      cookies.permanent[:unique] = SecureRandom.urlsafe_base64(20)
    end
    
    @recent = Recent.find_by_sql("SELECT * FROM Recents, Courses WHERE Recents.cookieID = '#{cookies[:unique]}' AND Courses.id == Recents.vakID ORDER BY timestamp DESC")
  end
  
end
