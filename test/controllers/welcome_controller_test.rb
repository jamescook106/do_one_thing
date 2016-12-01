require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @base_title = "Do1Thing"
  end

## This test will pass but the to_date in the index will
## return an error
  test "should get index" do
    @jobs = Job.all
    get :show, page: 'index'
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get about" do
    get :show, page: 'about'
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact_us" do
    get :show, page: 'contact_us'
    assert_response :success
    assert_select "title", "Contact us | #{@base_title}"
  end

end
