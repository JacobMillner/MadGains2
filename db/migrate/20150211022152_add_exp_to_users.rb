class AddExpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :exp, :int
  end
end
