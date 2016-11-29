class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end

  def add_tag
    current_user.tag_list.add(params["user"]["tag_list"], parse: true)
    ActsAsTaggableOn.force_lowercase = true
    current_user.save
    redirect_to '/users/edit'
  end

  def remove_tag
    current_user.tag_list.remove(params["user"]["tag_list"], parse: true)
    current_user.save
    redirect_to '/users/edit'
  end

end
