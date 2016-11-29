class RequestsController < ApplicationController
<<<<<<< HEAD
  #validate :not_friends
  #validate :not_pending

=======
>>>>>>> 58efa6a4d1d070b2163126b231866a75b62ccf2b
  before_action :set_request, except: [:index, :create]

  def index
    @incoming = Request.where(match: current_user)
    @outgoing = current_user.requests
  end

  def create
    match = User.find(params[:match_id])
    @request = current_user.requests.new(match: match, status: params[:status])

    @request.save
    redirect_to root_path
  end
  private#

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
