class AddExpiryToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :expiry, :datetime
  end
end
