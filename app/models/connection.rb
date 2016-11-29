class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :match, class_name: 'User'

  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  private

  def create_inverse_relationship
    match.connection.create(match: user)
  end

  def destroy_inverse_relationship
    connection = match.connections.find_by(match: user)
    connection.destroy if connection
  end
end
