class CourseController < ActionController::Base
  def index
    redirect_to :action => 'list', :instituut => 'all'
    test
  end
  
  def list
    if params[:instituut] == 'all'
      @courses = Course.all
    else
    @courses = Course.where(:instituut => params[:instituut])
    end
    @institutes = Course.select("DISTINCT instituut")
    
    #saved = Course.new(:vakID => 1, :vaknaam => 'tekenen', :periode => '3 maanden', :ects => 6, :instituut => 'FNWI', :beschrijving => 'Kut vak', :leerdoelen => 'Geen ster te leren hier', :examinatie => 'schouderklopje')
    #saved.save
  end
  
  def information
    @information = Course.where(:vaknaam => params[:vaknaam])
  end
  
  def test
    session[:my_key] = 'my value'
    @test = session[:my_key]
  end
  
end
