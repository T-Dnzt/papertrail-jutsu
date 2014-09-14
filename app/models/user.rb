class User < ActiveRecord::Base
  has_many :documents

  def self.find_version_author(version)
    find(version.terminator)   
  end

end
