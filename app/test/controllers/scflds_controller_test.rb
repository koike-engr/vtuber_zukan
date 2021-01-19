require 'test_helper'

class ScfldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scfld = scflds(:one)
  end

  test "should get index" do
    get scflds_url
    assert_response :success
  end

  test "should get new" do
    get new_scfld_url
    assert_response :success
  end

  test "should create scfld" do
    assert_difference('Scfld.count') do
      post scflds_url, params: { scfld: { age: @scfld.age, name: @scfld.name } }
    end

    assert_redirected_to scfld_url(Scfld.last)
  end

  test "should show scfld" do
    get scfld_url(@scfld)
    assert_response :success
  end

  test "should get edit" do
    get edit_scfld_url(@scfld)
    assert_response :success
  end

  test "should update scfld" do
    patch scfld_url(@scfld), params: { scfld: { age: @scfld.age, name: @scfld.name } }
    assert_redirected_to scfld_url(@scfld)
  end

  test "should destroy scfld" do
    assert_difference('Scfld.count', -1) do
      delete scfld_url(@scfld)
    end

    assert_redirected_to scflds_url
  end
end
