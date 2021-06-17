require "application_system_test_case"

class ConstructionsActivitiesTest < ApplicationSystemTestCase
  setup do
    @constructions_activity = constructions_activities(:one)
  end

  test "visiting the index" do
    visit constructions_activities_url
    assert_selector "h1", text: "Constructions Activities"
  end

  test "creating a Constructions activity" do
    visit constructions_activities_url
    click_on "New Constructions Activity"

    fill_in "Activities type", with: @constructions_activity.activities_type_id
    fill_in "Construction", with: @constructions_activity.construction_id
    fill_in "User", with: @constructions_activity.user_id
    click_on "Create Constructions activity"

    assert_text "Constructions activity was successfully created"
    click_on "Back"
  end

  test "updating a Constructions activity" do
    visit constructions_activities_url
    click_on "Edit", match: :first

    fill_in "Activities type", with: @constructions_activity.activities_type_id
    fill_in "Construction", with: @constructions_activity.construction_id
    fill_in "User", with: @constructions_activity.user_id
    click_on "Update Constructions activity"

    assert_text "Constructions activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Constructions activity" do
    visit constructions_activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Constructions activity was successfully destroyed"
  end
end
