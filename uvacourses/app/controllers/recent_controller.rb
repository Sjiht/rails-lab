class RecentController < ActionController::Base
  def index 
    list
  end
 
  def list
    if cookies.permanent[:unique].blank?
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...50).map{ o[rand(o.length)] }.join
      cookies.permanent[:unique] = string
    end
    
    @recent = Recent.find_by_sql("SELECT * FROM Recents, Courses WHERE Recents.cookieID = '#{cookies[:unique]}' AND Courses.id == Recents.vakID ORDER BY timestamp DESC")
  end
  
end
