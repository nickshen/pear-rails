class HomeController < ApplicationController

  def new
  end

  def create
  end

  def index
    if current_user
      if User.where.not(id: current_user.id).where.not(id: current_user.pending_matches).where.not(id: current_user.requests).any?
        @User = User.where.not(id: current_user.id).where.not(id: current_user.pending_matches).where.not(id: current_user.requests).order('RANDOM()').first
      end
    end
  end

end
