require "application_system_test_case"

class IntsTest < ApplicationSystemTestCase
  setup do
    @int = ints(:one)
  end

  test "visiting the index" do
    visit ints_url
    assert_selector "h1", text: "Ints"
  end

  test "creating a Int" do
    visit ints_url
    click_on "New Int"

    click_on "Create Int"

    assert_text "Int was successfully created"
    click_on "Back"
  end

  test "updating a Int" do
    visit ints_url
    click_on "Edit", match: :first

    click_on "Update Int"

    assert_text "Int was successfully updated"
    click_on "Back"
  end

  test "destroying a Int" do
    visit ints_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Int was successfully destroyed"
  end
end
