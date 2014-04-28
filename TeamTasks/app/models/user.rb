class User < ActiveRecord::Base
  # associations
  has_many :authorizations
  
  def self.create_from_hash!(hash)
    # create a new user from facebook hash
    create(:name => hash['info']['name'])
  end
end