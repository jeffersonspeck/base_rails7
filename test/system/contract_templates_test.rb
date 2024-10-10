require "application_system_test_case"

class ContractTemplatesTest < ApplicationSystemTestCase
  setup do
    @contract_template = contract_templates(:one)
  end

  test "visiting the index" do
    visit contract_templates_url
    assert_selector "h1", text: "Contract templates"
  end

  test "should create contract template" do
    visit contract_templates_url
    click_on "New contract template"

    check "Active" if @contract_template.active
    fill_in "Contract type", with: @contract_template.contract_type_id
    fill_in "Description", with: @contract_template.description
    fill_in "Name", with: @contract_template.name
    click_on "Create Contract template"

    assert_text "Contract template was successfully created"
    click_on "Back"
  end

  test "should update Contract template" do
    visit contract_template_url(@contract_template)
    click_on "Edit this contract template", match: :first

    check "Active" if @contract_template.active
    fill_in "Contract type", with: @contract_template.contract_type_id
    fill_in "Description", with: @contract_template.description
    fill_in "Name", with: @contract_template.name
    click_on "Update Contract template"

    assert_text "Contract template was successfully updated"
    click_on "Back"
  end

  test "should destroy Contract template" do
    visit contract_template_url(@contract_template)
    click_on "Destroy this contract template", match: :first

    assert_text "Contract template was successfully destroyed"
  end
end
