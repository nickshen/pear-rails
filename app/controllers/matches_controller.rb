class MatchesController < ApplicationController

  def index
    @matches = current_user.matches
  end
  
  private

  def set_friend
    @match = current_user.matches.find(params[:id])
  end

  def destroy
    current_user.remove_match(@match)
    head :no_content
  end
end
