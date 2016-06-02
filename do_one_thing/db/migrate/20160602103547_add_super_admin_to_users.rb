class AddSuperAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sadmin, :boolean, default: false
  end
end
