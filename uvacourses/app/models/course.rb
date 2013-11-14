class Course < ActiveRecord::Base
  has_many :saveds
  has_many :favorites
end
