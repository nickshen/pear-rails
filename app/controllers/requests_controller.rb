class RequestsController < ApplicationController
  before_action :set_request, except: [:index, :create]

  def index
    @incoming = Request.where(match: current_user)
    @outgoing = current_user.requests
  end

  def create
    match = User.find(params[:match_id])
    @request = current_user.requests.new(match: match, status: params[:status])

    @request.save
    redirect_to :back
  end

  def update
    @request.accept
    redirect_to :back
  end

  def destroy
    @request.destroy
    redirect_to :back
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def not_matches
    errors.add(:match, 'is already added') if user.matches.include?(match)
  end

  def not_pending
    errors.add(:match, 'already requested match') if match.pending_matches.include?(user)
  end

end
