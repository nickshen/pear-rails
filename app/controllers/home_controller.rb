class HomeController < ApplicationController

  def new
  end

  def create
  end

  def index
    @User = User.where.not(id: current_user.id).order('RANDOM()').first
  end

  def _match
  end
end
