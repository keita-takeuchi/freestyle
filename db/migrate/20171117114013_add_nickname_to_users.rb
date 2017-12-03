class AddNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :image_url, :text
    add_column :users, :description, :text
  end
end
