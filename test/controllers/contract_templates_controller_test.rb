require "test_helper"

class ContractTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_template = contract_templates(:one)
  end

  test "should get index" do
    get contract_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_template_url
    assert_response :success
  end

  test "should create contract_template" do
    assert_difference("ContractTemplate.count") do
      post contract_templates_url, params: { contract_template: { active: @contract_template.active, contract_type_id: @contract_template.contract_type_id, description: @contract_template.description, name: @contract_template.name } }
    end

    assert_redirected_to contract_template_url(ContractTemplate.last)
  end

  test "should show contract_template" do
    get contract_template_url(@contract_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_template_url(@contract_template)
    assert_response :success
  end

  test "should update contract_template" do
    patch contract_template_url(@contract_template), params: { contract_template: { active: @contract_template.active, contract_type_id: @contract_template.contract_type_id, description: @contract_template.description, name: @contract_template.name } }
    assert_redirected_to contract_template_url(@contract_template)
  end

  test "should destroy contract_template" do
    assert_difference("ContractTemplate.count", -1) do
      delete contract_template_url(@contract_template)
    end

    assert_redirected_to contract_templates_url
  end
end
