class AddUClassToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uClass, :string
  end
end
