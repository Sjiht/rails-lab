class CourseController < ActionController::Base
  require 'securerandom'

  def index
    redirect_to :action => 'list', :instituut => 'all'
  end
  
  def list
    
    # generate cookie if it doesn't exist, with 20 random characters
    if cookies.permanent[:unique].blank?
      cookies.permanent[:unique] = SecureRandom.urlsafe_base64(20)
    end
    
    # if there is no institute selected display nothing
    if params[:instituut] == 'all'
      @courses = []
      
      # add instructions if a user has no faculty selected
      @message = 'Kies hierboven uit een lijst van faculteiten om een lijst van vakken te krijgen. 
                  Deze vakken kunnen vervolgens opgeslagen worden, en in favorieten geplaatst worden. 
                  Om meer informatie te krijgen over een vak kan op een vak geklikt worden.'
    # if there is an institute selected get all courses from that institute
    else
      @courses = Course.where(:faculteitID => params[:instituut])
    end
    
    # get all institutes
    @institutes = Faculteiten.all.order(:faculteitnaam)

  end
  
  def information
    
    # get all teachers for the selected course
    @docenten = Docenten.where(:vakID => params[:vakID])
    
    # get the information for the selected course
    @information = Course.find_by_sql("SELECT * FROM Courses WHERE id = '#{params[:vakID]}'")
    
    # when viewing a course, check if it already is present in recent and delete it
    recent = Recent.where(:cookieID => cookies[:unique], :vakID => params[:vakID]).destroy_all
    # insert the course in recent
    recent = Recent.create(:cookieID => cookies[:unique], :vakID => params[:vakID], :timestamp => DateTime.now)
    recent.save
    
  end
  
end
