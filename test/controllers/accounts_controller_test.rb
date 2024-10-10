require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference("Account.count") do
      post accounts_url, params: { account: { address_line1: @account.address_line1, address_line2: @account.address_line2, birthdate: @account.birthdate, city: @account.city, contact_email: @account.contact_email, contact_name: @account.contact_name, contact_phone: @account.contact_phone, country: @account.country, cpf_cnpj: @account.cpf_cnpj, email: @account.email, name: @account.name, person_type: @account.person_type, phone: @account.phone, state: @account.state, zip_code: @account.zip_code } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account" do
    patch account_url(@account), params: { account: { address_line1: @account.address_line1, address_line2: @account.address_line2, birthdate: @account.birthdate, city: @account.city, contact_email: @account.contact_email, contact_name: @account.contact_name, contact_phone: @account.contact_phone, country: @account.country, cpf_cnpj: @account.cpf_cnpj, email: @account.email, name: @account.name, person_type: @account.person_type, phone: @account.phone, state: @account.state, zip_code: @account.zip_code } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end
