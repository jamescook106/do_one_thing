class AddContactToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contact, :text
  end
end
