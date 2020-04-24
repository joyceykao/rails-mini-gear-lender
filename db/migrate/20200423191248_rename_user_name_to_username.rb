class RenameUserNameToUsername < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :user_name, :username
  end
end
