class AddColumns < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :major, :string
  end
end
