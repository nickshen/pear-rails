class RemoveIdFromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :user_id
    remove_column :matches, :match_id
  end
end
