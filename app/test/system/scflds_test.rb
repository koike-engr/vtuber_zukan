require "application_system_test_case"

class ScfldsTest < ApplicationSystemTestCase
  setup do
    @scfld = scflds(:one)
  end

  test "visiting the index" do
    visit scflds_url
    assert_selector "h1", text: "Scflds"
  end

  test "creating a Scfld" do
    visit scflds_url
    click_on "New Scfld"

    fill_in "Age", with: @scfld.age
    fill_in "Name", with: @scfld.name
    click_on "Create Scfld"

    assert_text "Scfld was successfully created"
    click_on "Back"
  end

  test "updating a Scfld" do
    visit scflds_url
    click_on "Edit", match: :first

    fill_in "Age", with: @scfld.age
    fill_in "Name", with: @scfld.name
    click_on "Update Scfld"

    assert_text "Scfld was successfully updated"
    click_on "Back"
  end

  test "destroying a Scfld" do
    visit scflds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scfld was successfully destroyed"
  end
end
