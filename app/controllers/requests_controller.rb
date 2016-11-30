class RequestsController < ApplicationController
  before_action :set_request, except: [:index, :create]
  before_action :authenticate_user!

  def index
    @incoming = Request.where(match: current_user)
    if current_user.requests.where(status: true).any?
      @outgoing_match = current_user.requests.where(status: true)
    end
    if current_user.requests.where(status: false).any?
      @outgoing_passed = current_user.requests.where(status: false)
    end
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
