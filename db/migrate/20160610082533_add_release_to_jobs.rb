class AddReleaseToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :release, :datetime
  end
end
