class Document < ActiveRecord::Base
  belongs_to :user

  has_paper_trail

  def user_name
    user ? user.name : ''
  end
end
