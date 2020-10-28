require "application_system_test_case"

class DietsTest < ApplicationSystemTestCase
  setup do
    @diet = diets(:one)
  end

  test "visiting the index" do
    visit diets_url
    assert_selector "h1", text: "Diets"
  end

  test "creating a Diet" do
    visit diets_url
    click_on "New Diet"

    fill_in "Description", with: @diet.description
    fill_in "Name", with: @diet.name
    fill_in "User", with: @diet.user_id
    fill_in "Weekdays", with: @diet.weekdays
    click_on "Create Diet"

    assert_text "Diet was successfully created"
    click_on "Back"
  end

  test "updating a Diet" do
    visit diets_url
    click_on "Edit", match: :first

    fill_in "Description", with: @diet.description
    fill_in "Name", with: @diet.name
    fill_in "User", with: @diet.user_id
    fill_in "Weekdays", with: @diet.weekdays
    click_on "Update Diet"

    assert_text "Diet was successfully updated"
    click_on "Back"
  end

  test "destroying a Diet" do
    visit diets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diet was successfully destroyed"
  end
end
