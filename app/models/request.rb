class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :match, class_name: "User"

<<<<<<< HEAD
  def accept#
    user.matches << match#
    destroy#
  end#
=======
  def accept
    user.matches << match
    destroy
  end
  
>>>>>>> 39a06a388d3776278006794e35bd989cc1b8cfc4
end
