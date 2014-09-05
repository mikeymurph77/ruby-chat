class AddUserLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :github, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :blog, :string
    add_column :users, :bio, :text
  end
end
