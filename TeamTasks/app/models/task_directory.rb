class TaskDirectory < ActiveRecord::Base
  has_many :taskDirectoryUsers
  has_many :tasks
end
