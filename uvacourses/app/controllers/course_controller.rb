class CourseController < ActionController::Base
  require 'securerandom'

  def index
    redirect_to :action => 'list', :instituut => 'all'
  end
  
  def list
    if params[:instituut] == 'all'
      @courses = []
    else
      @courses = Course.where(:faculteitID => params[:instituut])
    end
    
    @institutes = Faculteiten.all.order(:faculteitnaam)
    
    if cookies.permanent[:unique].blank?
      cookies.permanent[:unique] = SecureRandom.urlsafe_base64(20)
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
