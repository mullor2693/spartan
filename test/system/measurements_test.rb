require "application_system_test_case"

class MeasurementsTest < ApplicationSystemTestCase
  setup do
    @measurement = measurements(:one)
  end

  test "visiting the index" do
    visit measurements_url
    assert_selector "h1", text: "Measurements"
  end

  test "creating a Measurement" do
    visit measurements_url
    click_on "New Measurement"

    fill_in "Hip", with: @measurement.hip
    fill_in "Left arm", with: @measurement.left_arm
    fill_in "Left forearm", with: @measurement.left_forearm
    fill_in "Left leg", with: @measurement.left_leg
    fill_in "Left twin", with: @measurement.left_twin
    fill_in "Pecs", with: @measurement.pecs
    fill_in "Right arm", with: @measurement.right_arm
    fill_in "Right forearm", with: @measurement.right_forearm
    fill_in "Right leg", with: @measurement.right_leg
    fill_in "Right twin", with: @measurement.right_twin
    fill_in "Shoulder", with: @measurement.shoulder
    fill_in "User", with: @measurement.user_id
    fill_in "Waist", with: @measurement.waist
    click_on "Create Measurement"

    assert_text "Measurement was successfully created"
    click_on "Back"
  end

  test "updating a Measurement" do
    visit measurements_url
    click_on "Edit", match: :first

    fill_in "Hip", with: @measurement.hip
    fill_in "Left arm", with: @measurement.left_arm
    fill_in "Left forearm", with: @measurement.left_forearm
    fill_in "Left leg", with: @measurement.left_leg
    fill_in "Left twin", with: @measurement.left_twin
    fill_in "Pecs", with: @measurement.pecs
    fill_in "Right arm", with: @measurement.right_arm
    fill_in "Right forearm", with: @measurement.right_forearm
    fill_in "Right leg", with: @measurement.right_leg
    fill_in "Right twin", with: @measurement.right_twin
    fill_in "Shoulder", with: @measurement.shoulder
    fill_in "User", with: @measurement.user_id
    fill_in "Waist", with: @measurement.waist
    click_on "Update Measurement"

    assert_text "Measurement was successfully updated"
    click_on "Back"
  end

  test "destroying a Measurement" do
    visit measurements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Measurement was successfully destroyed"
  end
end
