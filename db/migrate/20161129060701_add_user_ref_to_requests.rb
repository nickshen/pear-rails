class AddUserRefToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :user_id, index: true, foreign_key: true
    add_reference :requests, :requesting_id, index: true, foreign_key: true
  end
end
