require 'test_helper'

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurement = measurements(:one)
  end

  test "should get index" do
    get measurements_url
    assert_response :success
  end

  test "should get new" do
    get new_measurement_url
    assert_response :success
  end

  test "should create measurement" do
    assert_difference('Measurement.count') do
      post measurements_url, params: { measurement: { hip: @measurement.hip, left_arm: @measurement.left_arm, left_forearm: @measurement.left_forearm, left_leg: @measurement.left_leg, left_twin: @measurement.left_twin, pecs: @measurement.pecs, right_arm: @measurement.right_arm, right_forearm: @measurement.right_forearm, right_leg: @measurement.right_leg, right_twin: @measurement.right_twin, shoulder: @measurement.shoulder, user_id: @measurement.user_id, waist: @measurement.waist } }
    end

    assert_redirected_to measurement_url(Measurement.last)
  end

  test "should show measurement" do
    get measurement_url(@measurement)
    assert_response :success
  end

  test "should get edit" do
    get edit_measurement_url(@measurement)
    assert_response :success
  end

  test "should update measurement" do
    patch measurement_url(@measurement), params: { measurement: { hip: @measurement.hip, left_arm: @measurement.left_arm, left_forearm: @measurement.left_forearm, left_leg: @measurement.left_leg, left_twin: @measurement.left_twin, pecs: @measurement.pecs, right_arm: @measurement.right_arm, right_forearm: @measurement.right_forearm, right_leg: @measurement.right_leg, right_twin: @measurement.right_twin, shoulder: @measurement.shoulder, user_id: @measurement.user_id, waist: @measurement.waist } }
    assert_redirected_to measurement_url(@measurement)
  end

  test "should destroy measurement" do
    assert_difference('Measurement.count', -1) do
      delete measurement_url(@measurement)
    end

    assert_redirected_to measurements_url
  end
end
