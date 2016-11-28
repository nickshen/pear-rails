class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests

  def conversations
    Conversation.where('sender_id= ? OR recipient_id= ?', id, id)
  end

  has_many :requests
  has_many :matches
  has_many :matched_users, :through => :matches, dependent: :destroy do
    def with_match_data
      select('users.*, matches.created_at AS match_created_at')
    end

    def count(column_name = :all)
      super
    end
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
