require "application_system_test_case"

class LocsTest < ApplicationSystemTestCase
  setup do
    @loc = locs(:one)
  end

  test "visiting the index" do
    visit locs_url
    assert_selector "h1", text: "Locs"
  end

  test "creating a Loc" do
    visit locs_url
    click_on "New Loc"

    fill_in "Address 1", with: @loc.address_1
    fill_in "Address 2", with: @loc.address_2
    fill_in "City", with: @loc.city
    fill_in "Coordinate", with: @loc.coordinate
    fill_in "Postal code", with: @loc.postal_code
    fill_in "State", with: @loc.state
    click_on "Create Loc"

    assert_text "Loc was successfully created"
    click_on "Back"
  end

  test "updating a Loc" do
    visit locs_url
    click_on "Edit", match: :first

    fill_in "Address 1", with: @loc.address_1
    fill_in "Address 2", with: @loc.address_2
    fill_in "City", with: @loc.city
    fill_in "Coordinate", with: @loc.coordinate
    fill_in "Postal code", with: @loc.postal_code
    fill_in "State", with: @loc.state
    click_on "Update Loc"

    assert_text "Loc was successfully updated"
    click_on "Back"
  end

  test "destroying a Loc" do
    visit locs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loc was successfully destroyed"
  end
end
