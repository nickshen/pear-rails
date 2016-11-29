class HomeController < ApplicationController

  def new
  end

  def create
  end

  def index
    if current_user
      @User = User.where.not(id: current_user.id).order('RANDOM()').first
    end
  end

  def _match
  end
end
