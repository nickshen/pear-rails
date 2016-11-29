class RequestsController < ApplicationController
  validate :not_friends
  validate :not_pending

  before_action :set_request, except: [:index, :create]

  def index
    @incoming = Request.where(match: current_user)
    @outgoing = current_user.requests
  end

  def create
    match = User.match(params[:match_id])
    @request = current_user.requests.new(match: match)

    if @request.save
      render :show, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

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
