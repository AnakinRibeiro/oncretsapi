require "application_system_test_case"

class ActivitiesTypesTest < ApplicationSystemTestCase
  setup do
    @activities_type = activities_types(:one)
  end

  test "visiting the index" do
    visit activities_types_url
    assert_selector "h1", text: "Activities Types"
  end

  test "creating a Activities type" do
    visit activities_types_url
    click_on "New Activities Type"

    fill_in "Name", with: @activities_type.name
    click_on "Create Activities type"

    assert_text "Activities type was successfully created"
    click_on "Back"
  end

  test "updating a Activities type" do
    visit activities_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @activities_type.name
    click_on "Update Activities type"

    assert_text "Activities type was successfully updated"
    click_on "Back"
  end

  test "destroying a Activities type" do
    visit activities_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activities type was successfully destroyed"
  end
end
