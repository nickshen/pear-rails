class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :matches
  has_many :matched_users, :through => :matches

  has_many :inverse_matches, :class_name => "Match", :foreign_key => "matched_user_id"
  has_many :inverse_matched_users, :through => :inverse_matches, :source => :user

  def match_created_at
    Time.zone.parse(self[:match_created_at]) if self[:match_created_at]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def soft_delete
  	update_attribute(:deleted?, true)
  end
end
