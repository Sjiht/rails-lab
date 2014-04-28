class Authorization < ActiveRecord::Base
  # associations
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  def self.find_from_hash(hash)
    # retrieve user data from facebook hash
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end
  
  def self.create_from_hash(hash, user = nil)
    # create the user from facebook hash data
    user ||= User.create_from_hash!(hash)
    Authorization.create(:user => user, :uid => hash['uid'], :provider => hash['provider'])
  end
end