require "application_system_test_case"

class LimitsElongationsTest < ApplicationSystemTestCase
  setup do
    @limits_elongation = limits_elongations(:one)
  end

  test "visiting the index" do
    visit limits_elongations_url
    assert_selector "h1", text: "Limits Elongations"
  end

  test "creating a Limits elongation" do
    visit limits_elongations_url
    click_on "New Limits Elongation"

    fill_in "Final length", with: @limits_elongation.final_length
    fill_in "Inferior limit", with: @limits_elongation.inferior_limit
    fill_in "Initial length", with: @limits_elongation.initial_length
    fill_in "Upper limit", with: @limits_elongation.upper_limit
    click_on "Create Limits elongation"

    assert_text "Limits elongation was successfully created"
    click_on "Back"
  end

  test "updating a Limits elongation" do
    visit limits_elongations_url
    click_on "Edit", match: :first

    fill_in "Final length", with: @limits_elongation.final_length
    fill_in "Inferior limit", with: @limits_elongation.inferior_limit
    fill_in "Initial length", with: @limits_elongation.initial_length
    fill_in "Upper limit", with: @limits_elongation.upper_limit
    click_on "Update Limits elongation"

    assert_text "Limits elongation was successfully updated"
    click_on "Back"
  end

  test "destroying a Limits elongation" do
    visit limits_elongations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Limits elongation was successfully destroyed"
  end
end
