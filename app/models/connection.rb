class Connection < ActiveRecord::Base
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  belongs_to :user
  belongs_to :match, class_name: 'User'

  private

  def create_inverse_relationship
    if Connection.find_by(match_id: user.id).nil?
      match.connections.create(match: user)
    else
      true
    end
  end

  def destroy_inverse_relationship
    connection = match.connections.find_by(match: user)
    connection.destroy if connection
  end
end
