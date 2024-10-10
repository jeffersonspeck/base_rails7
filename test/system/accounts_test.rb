require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  setup do
    @account = accounts(:one)
  end

  test "visiting the index" do
    visit accounts_url
    assert_selector "h1", text: "Accounts"
  end

  test "should create account" do
    visit accounts_url
    click_on "New account"

    fill_in "Address line1", with: @account.address_line1
    fill_in "Address line2", with: @account.address_line2
    fill_in "Birthdate", with: @account.birthdate
    fill_in "City", with: @account.city
    fill_in "Contact email", with: @account.contact_email
    fill_in "Contact name", with: @account.contact_name
    fill_in "Contact phone", with: @account.contact_phone
    fill_in "Country", with: @account.country
    fill_in "Cpf cnpj", with: @account.cpf_cnpj
    fill_in "Email", with: @account.email
    fill_in "Name", with: @account.name
    fill_in "Person type", with: @account.person_type
    fill_in "Phone", with: @account.phone
    fill_in "State", with: @account.state
    fill_in "Zip code", with: @account.zip_code
    click_on "Create Account"

    assert_text "Account was successfully created"
    click_on "Back"
  end

  test "should update Account" do
    visit account_url(@account)
    click_on "Edit this account", match: :first

    fill_in "Address line1", with: @account.address_line1
    fill_in "Address line2", with: @account.address_line2
    fill_in "Birthdate", with: @account.birthdate
    fill_in "City", with: @account.city
    fill_in "Contact email", with: @account.contact_email
    fill_in "Contact name", with: @account.contact_name
    fill_in "Contact phone", with: @account.contact_phone
    fill_in "Country", with: @account.country
    fill_in "Cpf cnpj", with: @account.cpf_cnpj
    fill_in "Email", with: @account.email
    fill_in "Name", with: @account.name
    fill_in "Person type", with: @account.person_type
    fill_in "Phone", with: @account.phone
    fill_in "State", with: @account.state
    fill_in "Zip code", with: @account.zip_code
    click_on "Update Account"

    assert_text "Account was successfully updated"
    click_on "Back"
  end

  test "should destroy Account" do
    visit account_url(@account)
    click_on "Destroy this account", match: :first

    assert_text "Account was successfully destroyed"
  end
end
