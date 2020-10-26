require "application_system_test_case"

class EvaluationsTest < ApplicationSystemTestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "visiting the index" do
    visit evaluations_url
    assert_selector "h1", text: "Evaluations"
  end

  test "creating a Evaluation" do
    visit evaluations_url
    click_on "New Evaluation"

    fill_in "Abdominal skinfold", with: @evaluation.abdominal_skinfold
    fill_in "Axilliary skinfold", with: @evaluation.axilliary_skinfold
    fill_in "Bicipital skinfold", with: @evaluation.bicipital_skinfold
    fill_in "Evaluation date", with: @evaluation.evaluation_date
    fill_in "Fat rate", with: @evaluation.fat_rate
    fill_in "Fat weight", with: @evaluation.fat_weight
    fill_in "Femur bone diametre", with: @evaluation.femur_bone_diametre
    fill_in "Fist bone diametre", with: @evaluation.fist_bone_diametre
    fill_in "Height", with: @evaluation.height
    fill_in "Imc", with: @evaluation.imc
    fill_in "Medialcalf skinfold", with: @evaluation.medialcalf_skinfold
    fill_in "Muscle weight", with: @evaluation.muscle_weight
    fill_in "Residual weight", with: @evaluation.residual_weight
    fill_in "Slim weight", with: @evaluation.slim_weight
    fill_in "Subscapular skinfold", with: @evaluation.subscapular_skinfold
    fill_in "Suprailiac skinfold", with: @evaluation.suprailiac_skinfold
    fill_in "Thoracic skinfold", with: @evaluation.thoracic_skinfold
    fill_in "Triceps skinfold", with: @evaluation.triceps_skinfold
    fill_in "User", with: @evaluation.user_id
    fill_in "Weight", with: @evaluation.weight
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    click_on "Back"
  end

  test "updating a Evaluation" do
    visit evaluations_url
    click_on "Edit", match: :first

    fill_in "Abdominal skinfold", with: @evaluation.abdominal_skinfold
    fill_in "Axilliary skinfold", with: @evaluation.axilliary_skinfold
    fill_in "Bicipital skinfold", with: @evaluation.bicipital_skinfold
    fill_in "Evaluation date", with: @evaluation.evaluation_date
    fill_in "Fat rate", with: @evaluation.fat_rate
    fill_in "Fat weight", with: @evaluation.fat_weight
    fill_in "Femur bone diametre", with: @evaluation.femur_bone_diametre
    fill_in "Fist bone diametre", with: @evaluation.fist_bone_diametre
    fill_in "Height", with: @evaluation.height
    fill_in "Imc", with: @evaluation.imc
    fill_in "Medialcalf skinfold", with: @evaluation.medialcalf_skinfold
    fill_in "Muscle weight", with: @evaluation.muscle_weight
    fill_in "Residual weight", with: @evaluation.residual_weight
    fill_in "Slim weight", with: @evaluation.slim_weight
    fill_in "Subscapular skinfold", with: @evaluation.subscapular_skinfold
    fill_in "Suprailiac skinfold", with: @evaluation.suprailiac_skinfold
    fill_in "Thoracic skinfold", with: @evaluation.thoracic_skinfold
    fill_in "Triceps skinfold", with: @evaluation.triceps_skinfold
    fill_in "User", with: @evaluation.user_id
    fill_in "Weight", with: @evaluation.weight
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    click_on "Back"
  end

  test "destroying a Evaluation" do
    visit evaluations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Evaluation was successfully destroyed"
  end
end
