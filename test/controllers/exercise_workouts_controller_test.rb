require 'test_helper'

class ExerciseWorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_workout = exercise_workouts(:one)
  end

  test "should get index" do
    get exercise_workouts_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_workout_url
    assert_response :success
  end

  test "should create exercise_workout" do
    assert_difference('ExerciseWorkout.count') do
      post exercise_workouts_url, params: { exercise_workout: { exercise_id: @exercise_workout.exercise_id, notes: @exercise_workout.notes, serie_reps: @exercise_workout.serie_reps, serie_rest: @exercise_workout.serie_rest, serie_type: @exercise_workout.serie_type, series: @exercise_workout.series, workout_id: @exercise_workout.workout_id } }
    end

    assert_redirected_to exercise_workout_url(ExerciseWorkout.last)
  end

  test "should show exercise_workout" do
    get exercise_workout_url(@exercise_workout)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_workout_url(@exercise_workout)
    assert_response :success
  end

  test "should update exercise_workout" do
    patch exercise_workout_url(@exercise_workout), params: { exercise_workout: { exercise_id: @exercise_workout.exercise_id, notes: @exercise_workout.notes, serie_reps: @exercise_workout.serie_reps, serie_rest: @exercise_workout.serie_rest, serie_type: @exercise_workout.serie_type, series: @exercise_workout.series, workout_id: @exercise_workout.workout_id } }
    assert_redirected_to exercise_workout_url(@exercise_workout)
  end

  test "should destroy exercise_workout" do
    assert_difference('ExerciseWorkout.count', -1) do
      delete exercise_workout_url(@exercise_workout)
    end

    assert_redirected_to exercise_workouts_url
  end
end
