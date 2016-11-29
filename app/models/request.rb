class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :match, class_name: "User"

  def accept
    user.matches << match
    destroy
  end
  
end
