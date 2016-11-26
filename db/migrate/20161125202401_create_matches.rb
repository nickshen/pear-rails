class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :match_id
      t.string :create
      t.string :destroy

      t.timestamps null: false
    end
  end
end
