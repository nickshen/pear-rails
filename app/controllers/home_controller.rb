class HomeController < ApplicationController

  def new
  end

  def create
  end

  def index
    if current_user
      if current_user.connections.any?
        if User.where.not(id: current_user.id).where.not(id: current_user.requests.select("match_id")).where.not(current_user.connections.find_by(match_id: @user_on_home.id)).any?
          @User = User.where.not(id: current_user.id).where.not(id: current_user.requests.select("match_id")).where.not(current_user.connections.find_by(match_id: @user_on_home.id)).order('RANDOM()').first
        end
      else
        if User.where.not(id: current_user.id).where.not(id: current_user.requests.select("match_id")).any?
          @User = User.where.not(id: current_user.id).where.not(id: current_user.requests.select("match_id")).order('RANDOM()').first
        end
      end
    end
  end

end
