require 'test_helper'

class LocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loc = locs(:one)
  end

  test "should get index" do
    get locs_url
    assert_response :success
  end

  test "should get new" do
    get new_loc_url
    assert_response :success
  end

  test "should create loc" do
    assert_difference('Loc.count') do
      post locs_url, params: { loc: { address_1: @loc.address_1, address_2: @loc.address_2, city: @loc.city, coordinate: @loc.coordinate, postal_code: @loc.postal_code, state: @loc.state } }
    end

    assert_redirected_to loc_url(Loc.last)
  end

  test "should show loc" do
    get loc_url(@loc)
    assert_response :success
  end

  test "should get edit" do
    get edit_loc_url(@loc)
    assert_response :success
  end

  test "should update loc" do
    patch loc_url(@loc), params: { loc: { address_1: @loc.address_1, address_2: @loc.address_2, city: @loc.city, coordinate: @loc.coordinate, postal_code: @loc.postal_code, state: @loc.state } }
    assert_redirected_to loc_url(@loc)
  end

  test "should destroy loc" do
    assert_difference('Loc.count', -1) do
      delete loc_url(@loc)
    end

    assert_redirected_to locs_url
  end
end
