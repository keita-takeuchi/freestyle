class RenameTitreColumnToComments < ActiveRecord::Migration
  def change
    rename_column :comments, :usre_id, :user_id
  end
end
