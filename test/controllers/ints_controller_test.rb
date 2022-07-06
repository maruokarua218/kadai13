require 'test_helper'

class IntsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @int = ints(:one)
  end

  test "should get index" do
    get ints_url
    assert_response :success
  end

  test "should get new" do
    get new_int_url
    assert_response :success
  end

  test "should create int" do
    assert_difference('Int.count') do
      post ints_url, params: { int: {  } }
    end

    assert_redirected_to int_url(Int.last)
  end

  test "should show int" do
    get int_url(@int)
    assert_response :success
  end

  test "should get edit" do
    get edit_int_url(@int)
    assert_response :success
  end

  test "should update int" do
    patch int_url(@int), params: { int: {  } }
    assert_redirected_to int_url(@int)
  end

  test "should destroy int" do
    assert_difference('Int.count', -1) do
      delete int_url(@int)
    end

    assert_redirected_to ints_url
  end
end
