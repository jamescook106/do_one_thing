class AddCopyrightToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :copyright, :text
  end
end
