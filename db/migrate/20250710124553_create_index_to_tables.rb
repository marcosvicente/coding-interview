class CreateIndexToTables < ActiveRecord::Migration[7.2]
  def change
    add_index :companies, :name
    add_index :tweets, :body
    add_index :users, [ :display_name, :username, :email ]
  end
end
