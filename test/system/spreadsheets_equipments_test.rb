require "application_system_test_case"

class SpreadsheetsEquipmentsTest < ApplicationSystemTestCase
  setup do
    @spreadsheets_equipment = spreadsheets_equipments(:one)
  end

  test "visiting the index" do
    visit spreadsheets_equipments_url
    assert_selector "h1", text: "Spreadsheets Equipments"
  end

  test "creating a Spreadsheets equipment" do
    visit spreadsheets_equipments_url
    click_on "New Spreadsheets Equipment"

    fill_in "Elongations number", with: @spreadsheets_equipment.elongations_number
    fill_in "End", with: @spreadsheets_equipment.end
    fill_in "Jack", with: @spreadsheets_equipment.jack_id
    fill_in "Pump", with: @spreadsheets_equipment.pump_id
    fill_in "Spreadsheet", with: @spreadsheets_equipment.spreadsheet_id
    fill_in "Start", with: @spreadsheets_equipment.start
    click_on "Create Spreadsheets equipment"

    assert_text "Spreadsheets equipment was successfully created"
    click_on "Back"
  end

  test "updating a Spreadsheets equipment" do
    visit spreadsheets_equipments_url
    click_on "Edit", match: :first

    fill_in "Elongations number", with: @spreadsheets_equipment.elongations_number
    fill_in "End", with: @spreadsheets_equipment.end
    fill_in "Jack", with: @spreadsheets_equipment.jack_id
    fill_in "Pump", with: @spreadsheets_equipment.pump_id
    fill_in "Spreadsheet", with: @spreadsheets_equipment.spreadsheet_id
    fill_in "Start", with: @spreadsheets_equipment.start
    click_on "Update Spreadsheets equipment"

    assert_text "Spreadsheets equipment was successfully updated"
    click_on "Back"
  end

  test "destroying a Spreadsheets equipment" do
    visit spreadsheets_equipments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spreadsheets equipment was successfully destroyed"
  end
end
