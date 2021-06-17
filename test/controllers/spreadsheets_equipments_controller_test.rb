require 'test_helper'

class SpreadsheetsEquipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spreadsheets_equipment = spreadsheets_equipments(:one)
  end

  test "should get index" do
    get spreadsheets_equipments_url
    assert_response :success
  end

  test "should get new" do
    get new_spreadsheets_equipment_url
    assert_response :success
  end

  test "should create spreadsheets_equipment" do
    assert_difference('SpreadsheetsEquipment.count') do
      post spreadsheets_equipments_url, params: { spreadsheets_equipment: { elongations_number: @spreadsheets_equipment.elongations_number, end: @spreadsheets_equipment.end, jack_id: @spreadsheets_equipment.jack_id, pump_id: @spreadsheets_equipment.pump_id, spreadsheet_id: @spreadsheets_equipment.spreadsheet_id, start: @spreadsheets_equipment.start } }
    end

    assert_redirected_to spreadsheets_equipment_url(SpreadsheetsEquipment.last)
  end

  test "should show spreadsheets_equipment" do
    get spreadsheets_equipment_url(@spreadsheets_equipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_spreadsheets_equipment_url(@spreadsheets_equipment)
    assert_response :success
  end

  test "should update spreadsheets_equipment" do
    patch spreadsheets_equipment_url(@spreadsheets_equipment), params: { spreadsheets_equipment: { elongations_number: @spreadsheets_equipment.elongations_number, end: @spreadsheets_equipment.end, jack_id: @spreadsheets_equipment.jack_id, pump_id: @spreadsheets_equipment.pump_id, spreadsheet_id: @spreadsheets_equipment.spreadsheet_id, start: @spreadsheets_equipment.start } }
    assert_redirected_to spreadsheets_equipment_url(@spreadsheets_equipment)
  end

  test "should destroy spreadsheets_equipment" do
    assert_difference('SpreadsheetsEquipment.count', -1) do
      delete spreadsheets_equipment_url(@spreadsheets_equipment)
    end

    assert_redirected_to spreadsheets_equipments_url
  end
end
