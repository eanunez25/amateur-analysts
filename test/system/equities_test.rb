require "application_system_test_case"

class EquitiesTest < ApplicationSystemTestCase
  setup do
    @equity = equities(:one)
  end

  test "visiting the index" do
    visit equities_url
    assert_selector "h1", text: "Equities"
  end

  test "creating a Equity" do
    visit equities_url
    click_on "New Equity"

    fill_in "Ticker", with: @equity.ticker
    fill_in "User", with: @equity.user_id
    click_on "Create Equity"

    assert_text "Equity was successfully created"
    click_on "Back"
  end

  test "updating a Equity" do
    visit equities_url
    click_on "Edit", match: :first

    fill_in "Ticker", with: @equity.ticker
    fill_in "User", with: @equity.user_id
    click_on "Update Equity"

    assert_text "Equity was successfully updated"
    click_on "Back"
  end

  test "destroying a Equity" do
    visit equities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equity was successfully destroyed"
  end
end
