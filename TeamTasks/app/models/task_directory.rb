class TaskDirectory < ActiveRecord::Base
  has_many :taskDirectoryUsers
end
