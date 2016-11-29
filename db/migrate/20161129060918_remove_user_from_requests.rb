class RemoveUserFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :user_id_id
    remove_column :requests, :requesting_id_id
    remove_column :requests, :user_id
    remove_column :requests, :requesting_id

  end
end
