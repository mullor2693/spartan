require "application_system_test_case"

class ExerciseWorkoutsTest < ApplicationSystemTestCase
  setup do
    @exercise_workout = exercise_workouts(:one)
  end

  test "visiting the index" do
    visit exercise_workouts_url
    assert_selector "h1", text: "Exercise Workouts"
  end

  test "creating a Exercise workout" do
    visit exercise_workouts_url
    click_on "New Exercise Workout"

    fill_in "Exercise", with: @exercise_workout.exercise_id
    fill_in "Notes", with: @exercise_workout.notes
    fill_in "Serie reps", with: @exercise_workout.serie_reps
    fill_in "Serie rest", with: @exercise_workout.serie_rest
    fill_in "Serie type", with: @exercise_workout.serie_type
    fill_in "Series", with: @exercise_workout.series
    fill_in "Workout", with: @exercise_workout.workout_id
    click_on "Create Exercise workout"

    assert_text "Exercise workout was successfully created"
    click_on "Back"
  end

  test "updating a Exercise workout" do
    visit exercise_workouts_url
    click_on "Edit", match: :first

    fill_in "Exercise", with: @exercise_workout.exercise_id
    fill_in "Notes", with: @exercise_workout.notes
    fill_in "Serie reps", with: @exercise_workout.serie_reps
    fill_in "Serie rest", with: @exercise_workout.serie_rest
    fill_in "Serie type", with: @exercise_workout.serie_type
    fill_in "Series", with: @exercise_workout.series
    fill_in "Workout", with: @exercise_workout.workout_id
    click_on "Update Exercise workout"

    assert_text "Exercise workout was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise workout" do
    visit exercise_workouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise workout was successfully destroyed"
  end
end
