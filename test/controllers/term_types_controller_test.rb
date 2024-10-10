require "test_helper"

class TermTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @term_type = term_types(:one)
  end

  test "should get index" do
    get term_types_url
    assert_response :success
  end

  test "should get new" do
    get new_term_type_url
    assert_response :success
  end

  test "should create term_type" do
    assert_difference("TermType.count") do
      post term_types_url, params: { term_type: { active: @term_type.active, description: @term_type.description, name: @term_type.name } }
    end

    assert_redirected_to term_type_url(TermType.last)
  end

  test "should show term_type" do
    get term_type_url(@term_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_term_type_url(@term_type)
    assert_response :success
  end

  test "should update term_type" do
    patch term_type_url(@term_type), params: { term_type: { active: @term_type.active, description: @term_type.description, name: @term_type.name } }
    assert_redirected_to term_type_url(@term_type)
  end

  test "should destroy term_type" do
    assert_difference("TermType.count", -1) do
      delete term_type_url(@term_type)
    end

    assert_redirected_to term_types_url
  end
end
