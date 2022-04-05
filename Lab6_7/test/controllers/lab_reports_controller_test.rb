require "test_helper"

class LabReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_report = lab_reports(:one)
  end

  test "should get index" do
    get lab_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_report_url
    assert_response :success
  end

  test "should create lab_report" do
    assert_difference('LabReport.count') do
      post lab_reports_url, params: { lab_report: { description: @lab_report.description, grade: nil, title: @lab_report.title } }
    end

    assert_redirected_to lab_report_url(LabReport.last)
  end

  test "should show lab_report" do
    get lab_report_url(@lab_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_report_url(@lab_report)
    assert_response :success
  end

  test "should update lab_report" do
    patch lab_report_url(@lab_report), params: { lab_report: { description: @lab_report.description, grade: @lab_report.grade, title: @lab_report.title } }
    assert_redirected_to lab_report_url(@lab_report)
  end

  test "should destroy lab_report" do
    assert_difference('LabReport.count', -1) do
      delete lab_report_url(@lab_report)
    end

    assert_redirected_to lab_reports_url
  end
end
