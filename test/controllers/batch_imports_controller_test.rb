require "test_helper"

class BatchImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_import = batch_imports(:one)
  end

  test "should get index" do
    get batch_imports_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_import_url
    assert_response :success
  end

  test "should create batch_import" do
    assert_difference("BatchImport.count") do
      post batch_imports_url, params: { batch_import: { file_data: @batch_import.file_data, incorrect_information: @batch_import.incorrect_information, order_id: @batch_import.order_id, right_information: @batch_import.right_information, total_items: @batch_import.total_items, total_revenue: @batch_import.total_revenue } }
    end

    assert_redirected_to batch_import_url(BatchImport.last)
  end

  test "should show batch_import" do
    get batch_import_url(@batch_import)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_import_url(@batch_import)
    assert_response :success
  end

  test "should update batch_import" do
    patch batch_import_url(@batch_import), params: { batch_import: { file_data: @batch_import.file_data, incorrect_information: @batch_import.incorrect_information, order_id: @batch_import.order_id, right_information: @batch_import.right_information, total_items: @batch_import.total_items, total_revenue: @batch_import.total_revenue } }
    assert_redirected_to batch_import_url(@batch_import)
  end

  test "should destroy batch_import" do
    assert_difference("BatchImport.count", -1) do
      delete batch_import_url(@batch_import)
    end

    assert_redirected_to batch_imports_url
  end
end
