# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rubygems'
require 'nokogiri'
require 'open-uri'

Course.delete_all
Faculteiten.delete_all
Docenten.delete_all
Recent.delete_all
Favorite.delete_all
Saved.delete_all

courses = Nokogiri::XML(File.open("db/courses.xml"))

courses.xpath("//course").each do |course|
  instituteXML = course.xpath("institute").inner_text
  instituteSQL = Faculteiten.where(:faculteitnaam => instituteXML)
  if instituteSQL.empty? == true
    Faculteiten.create(
      faculteitnaam: instituteXML
    )
  end
  
  instituteSQL = Faculteiten.where(:faculteitnaam => instituteXML)
  Course.create(
    vaknaam: course.xpath("name").inner_text,
    faculteitID: instituteSQL[0].id,
    periode: course.xpath("period").inner_text,
    beschrijving: course.xpath("description").inner_text,
    leerdoelen: course.xpath("goals").inner_text,
    examinatie: course.xpath("examination").inner_text,
    ects: course.xpath("ects").inner_text
  )
  
  courseSQL = Course.where(:vaknaam => course.xpath("name").inner_text)
  course.xpath("staff_list").each do |individual|
    individual.xpath("staff").each do |information|
      Docenten.create(
        vakID: courseSQL[0].id,
        docentNaam: information.xpath("name").inner_text,
        docentURL: information.xpath("url").inner_text
      )
    end
  end
end



