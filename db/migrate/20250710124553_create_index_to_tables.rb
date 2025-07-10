# frozen_string_literal: true

class CreateIndexToTables < ActiveRecord::Migration[7.2]
  def change
    add_index :companies, :name
    add_index :tweets, :body
    add_index :users, %i[display_name username email]
  end
end
