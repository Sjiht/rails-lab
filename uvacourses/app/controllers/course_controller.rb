class CourseController < ActionController::Base
  def index
    redirect_to :action => 'list', :instituut => 'all'
  end
  
  def list
    if params[:instituut] == 'all'
      @courses = []
    else
      @courses = Course.find_by_sql("SELECT * FROM Courses, Faculteitens WHERE Faculteitens.id = '#{params[:instituut]}' AND Courses.faculteitID = Faculteitens.id")
    end
    @institutes = Faculteiten.all.order(:faculteitnaam)
    
    
    if cookies.permanent[:unique].blank?
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...50).map{ o[rand(o.length)] }.join
      cookies.permanent[:unique] = string
    end
    
  end
  
  def information
    
    @docenten = Docenten.where(:vakID => params[:vakID])
    @information = Course.find_by_sql("SELECT * FROM Courses WHERE id = '#{params[:vakID]}'")
    
    recent = Recent.where(:cookieID => cookies[:unique], :vakID => params[:vakID]).destroy_all
    recent = Recent.create(:cookieID => cookies[:unique], :vakID => params[:vakID], :timestamp => DateTime.now)
    recent.save
    
  end
  
end
