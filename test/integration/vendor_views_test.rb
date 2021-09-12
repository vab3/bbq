require "test_helper"

class VendorViewsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'user that is signed in shoud see add and edit' do
    sign_in users(:one)
    get vendors_path
    assert_select "a", "Add Vendor"
    assert_select "a", "Edit"
  end

  test 'user that is not signed in shoud see neither add nor edit' do
    get vendors_path
    assert_select "a", {count: 0, text: 'Add Vendor'}
    assert_select "a", {count: 0, text: 'Edit'}
  end

end
