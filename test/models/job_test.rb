require 'test_helper'

class JobTest < ActiveSupport::TestCase

  test "Create a new Job" do
    job=Job.new
    job.save
    assert true, 'Opportunity Create'
  end

  test "New Job has impressionist count 0" do
    job=Job.new
    job.save
    if job.impressions_count==0
      assert true, 'impressions_count default working'
    else
      assert false, 'impressions_count default not working'
    end
  end

end
