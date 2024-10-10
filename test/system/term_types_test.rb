require "application_system_test_case"

class TermTypesTest < ApplicationSystemTestCase
  setup do
    @term_type = term_types(:one)
  end

  test "visiting the index" do
    visit term_types_url
    assert_selector "h1", text: "Term types"
  end

  test "should create term type" do
    visit term_types_url
    click_on "New term type"

    check "Active" if @term_type.active
    fill_in "Description", with: @term_type.description
    fill_in "Name", with: @term_type.name
    click_on "Create Term type"

    assert_text "Term type was successfully created"
    click_on "Back"
  end

  test "should update Term type" do
    visit term_type_url(@term_type)
    click_on "Edit this term type", match: :first

    check "Active" if @term_type.active
    fill_in "Description", with: @term_type.description
    fill_in "Name", with: @term_type.name
    click_on "Update Term type"

    assert_text "Term type was successfully updated"
    click_on "Back"
  end

  test "should destroy Term type" do
    visit term_type_url(@term_type)
    click_on "Destroy this term type", match: :first

    assert_text "Term type was successfully destroyed"
  end
end
