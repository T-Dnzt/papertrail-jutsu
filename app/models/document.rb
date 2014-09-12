class Document < ActiveRecord::Base
  belongs_to :user

  def user_name
    user ? user.name : ''
  end
end
