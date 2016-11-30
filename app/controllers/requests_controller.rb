class RequestsController < ApplicationController
  before_action :set_request, except: [:index, :create]

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
  private

  def update
    @request.accept
    head :no_content
  end

  def destroy
    @request.destroy
    head :no_content
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
