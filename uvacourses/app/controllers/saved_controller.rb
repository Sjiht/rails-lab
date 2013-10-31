class SavedController < ActionController::Base
  def index 
    list
    cookie
  end
  def list
    #@cookie = selecteer alles waar aapje = saved.cookieID
    @cookie = Saved.where(:cookieID => 'aapje')
    @all = Saved.find_by_sql("SELECT * FROM Saveds, Courses WHERE Saveds.cookieID = '2' AND Courses.vakID == Saveds.vakID")
    #@vak = selecteer je alles saved.vakID = course.vakID
    #saved = Saved.new(:vakID => 3, :cookieID => '3' )
    #saved.save
  end
  
  def cookie
    #cookies.permanent[:github_username] = 'neerajdotname'
    #session[:my_key] = 'my value'
  end
end