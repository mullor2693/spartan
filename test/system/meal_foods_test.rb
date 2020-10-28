require "application_system_test_case"

class MealFoodsTest < ApplicationSystemTestCase
  setup do
    @meal_food = meal_foods(:one)
  end

  test "visiting the index" do
    visit meal_foods_url
    assert_selector "h1", text: "Meal Foods"
  end

  test "creating a Meal food" do
    visit meal_foods_url
    click_on "New Meal Food"

    fill_in "Food", with: @meal_food.food_id
    fill_in "Meal", with: @meal_food.meal_id
    fill_in "Quantity", with: @meal_food.quantity
    fill_in "Unit", with: @meal_food.unit
    click_on "Create Meal food"

    assert_text "Meal food was successfully created"
    click_on "Back"
  end

  test "updating a Meal food" do
    visit meal_foods_url
    click_on "Edit", match: :first

    fill_in "Food", with: @meal_food.food_id
    fill_in "Meal", with: @meal_food.meal_id
    fill_in "Quantity", with: @meal_food.quantity
    fill_in "Unit", with: @meal_food.unit
    click_on "Update Meal food"

    assert_text "Meal food was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal food" do
    visit meal_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal food was successfully destroyed"
  end
end
