require "application_system_test_case"

class BatchImportsTest < ApplicationSystemTestCase
  setup do
    @batch_import = batch_imports(:one)
  end

  test "visiting the index" do
    visit batch_imports_url
    assert_selector "h1", text: "Batch imports"
  end

  test "should create batch import" do
    visit batch_imports_url
    click_on "New batch import"

    fill_in "File data", with: @batch_import.file_data
    fill_in "Incorrect information", with: @batch_import.incorrect_information
    fill_in "Order", with: @batch_import.order_id
    fill_in "Right information", with: @batch_import.right_information
    fill_in "Total items", with: @batch_import.total_items
    fill_in "Total revenue", with: @batch_import.total_revenue
    click_on "Create Batch import"

    assert_text "Batch import was successfully created"
    click_on "Back"
  end

  test "should update Batch import" do
    visit batch_import_url(@batch_import)
    click_on "Edit this batch import", match: :first

    fill_in "File data", with: @batch_import.file_data
    fill_in "Incorrect information", with: @batch_import.incorrect_information
    fill_in "Order", with: @batch_import.order_id
    fill_in "Right information", with: @batch_import.right_information
    fill_in "Total items", with: @batch_import.total_items
    fill_in "Total revenue", with: @batch_import.total_revenue
    click_on "Update Batch import"

    assert_text "Batch import was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch import" do
    visit batch_import_url(@batch_import)
    click_on "Destroy this batch import", match: :first

    assert_text "Batch import was successfully destroyed"
  end
end
