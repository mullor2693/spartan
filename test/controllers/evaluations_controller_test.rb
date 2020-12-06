require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluation = evaluations(:one)
  end

  test "should get index" do
    get evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_evaluation_url
    assert_response :success
  end

  test "should create evaluation" do
    assert_difference('Evaluation.count') do
      post evaluations_url, params: { evaluation: { abdominal_skinfold: @evaluation.abdominal_skinfold, axilliary_skinfold: @evaluation.axilliary_skinfold, bicipital_skinfold: @evaluation.bicipital_skinfold, evaluation_date: @evaluation.evaluation_date, fat_rate: @evaluation.fat_rate, femur_bone_diametre: @evaluation.femur_bone_diametre, fist_bone_diametre: @evaluation.fist_bone_diametre, height: @evaluation.height, imc: @evaluation.imc, medialcalf_skinfold: @evaluation.medialcalf_skinfold, muscle_weight: @evaluation.muscle_weight, residual_weight: @evaluation.residual_weight, slim_weight: @evaluation.slim_weight, subscapular_skinfold: @evaluation.subscapular_skinfold, suprailiac_skinfold: @evaluation.suprailiac_skinfold, thoracic_skinfold: @evaluation.thoracic_skinfold, triceps_skinfold: @evaluation.triceps_skinfold, user_id: @evaluation.user_id, weight: @evaluation.weight } }
    end

    assert_redirected_to evaluation_url(Evaluation.last)
  end

  test "should show evaluation" do
    get evaluation_url(@evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_evaluation_url(@evaluation)
    assert_response :success
  end

  test "should update evaluation" do
    patch evaluation_url(@evaluation), params: { evaluation: { abdominal_skinfold: @evaluation.abdominal_skinfold, axilliary_skinfold: @evaluation.axilliary_skinfold, bicipital_skinfold: @evaluation.bicipital_skinfold, evaluation_date: @evaluation.evaluation_date, fat_rate: @evaluation.fat_rate, femur_bone_diametre: @evaluation.femur_bone_diametre, fist_bone_diametre: @evaluation.fist_bone_diametre, height: @evaluation.height, imc: @evaluation.imc, medialcalf_skinfold: @evaluation.medialcalf_skinfold, muscle_weight: @evaluation.muscle_weight, residual_weight: @evaluation.residual_weight, slim_weight: @evaluation.slim_weight, subscapular_skinfold: @evaluation.subscapular_skinfold, suprailiac_skinfold: @evaluation.suprailiac_skinfold, thoracic_skinfold: @evaluation.thoracic_skinfold, triceps_skinfold: @evaluation.triceps_skinfold, user_id: @evaluation.user_id, weight: @evaluation.weight } }
    assert_redirected_to evaluation_url(@evaluation)
  end

  test "should destroy evaluation" do
    assert_difference('Evaluation.count', -1) do
      delete evaluation_url(@evaluation)
    end

    assert_redirected_to evaluations_url
  end
end
