class MatchesController < ApplicationController
  def create
    @match = current_user.matches.build(:match_id => params[:match_id])
    if @match.save
      flash[:notice] = "Added a match."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add your match."
      redirect_to root_url
    end
  end

  def destroy
    @match = current_user.matches.find(params[:id])
    @match.destroy
    flash[:notice] = "Removed match."
    redirect_to current_user
  end

end
