class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

      t.text :name
      t.boolean :primary
      t.boolean :secondary
      t.text :url
      t.text :tagline
      t.text :short
      t.text :content
      t.timestamps null: false
    end
  end
end
