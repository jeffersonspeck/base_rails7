require "application_system_test_case"

class ContractTypesTest < ApplicationSystemTestCase
  setup do
    @contract_type = contract_types(:one)
  end

  test "visiting the index" do
    visit contract_types_url
    assert_selector "h1", text: "Contract types"
  end

  test "should create contract type" do
    visit contract_types_url
    click_on "New contract type"

    check "Active" if @contract_type.active
    fill_in "Description", with: @contract_type.description
    fill_in "Name", with: @contract_type.name
    click_on "Create Contract type"

    assert_text "Contract type was successfully created"
    click_on "Back"
  end

  test "should update Contract type" do
    visit contract_type_url(@contract_type)
    click_on "Edit this contract type", match: :first

    check "Active" if @contract_type.active
    fill_in "Description", with: @contract_type.description
    fill_in "Name", with: @contract_type.name
    click_on "Update Contract type"

    assert_text "Contract type was successfully updated"
    click_on "Back"
  end

  test "should destroy Contract type" do
    visit contract_type_url(@contract_type)
    click_on "Destroy this contract type", match: :first

    assert_text "Contract type was successfully destroyed"
  end
end
