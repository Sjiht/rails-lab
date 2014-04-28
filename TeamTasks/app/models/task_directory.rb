class TaskDirectory < ActiveRecord::Base
  # associations
  has_many :taskDirectoryUsers
end
