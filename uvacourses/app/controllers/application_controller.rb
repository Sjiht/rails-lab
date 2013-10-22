class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    
    require 'rubygems'
    gem 'nokogiri'
    require 'nokogiri'
    require 'open-uri'
    Course.delete_all
        courses = Nokogiri::XML(File.open("courses.xml"))
    
        courses.css('course').each do |node|
          children = node.children
    
          Course.create(
            name: children.css('name').inner_text,
            ects: children.css('ects').inner_text
          )
    
      def down
      end
    end
    
=begin
    course = Course.new
    course.vaknaam = "vak1"
    course.instituut = "instituut1"
    course.periode = "periode"
    course.beschrijving = "beschrijving"
    course.leerdoelen = "leerdoelen"
    course.examinatie = "examinatie"
    course.ects = 6
    course.save
=end
    
    variabelen
    
  end
  
  def variabelen
    @message = Course.last
  end
end
