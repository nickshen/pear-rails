class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :requests, dependent: :destroy
  has_many :pending_matches, through: :requests, source: :match

  has_many :connections, dependent: :destroy
  has_many :matches, through: :connections

  acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests

  def conversations
    Conversation.where('sender_id= ? OR recipient_id= ?', id, id)
  end

  def remove_match(match)
    current_user.matches.destroy(match)
  end

  def match_created_at
    Time.zone.parse(self[:match_created_at]) if self[:match_created_at]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def soft_delete
  	update_attribute(:deleted?, true)
  end

  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml

    super && (deleted? == false)
  end
end
