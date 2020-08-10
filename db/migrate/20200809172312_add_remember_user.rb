class AddRememberUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_user, :boolean
  end
end
