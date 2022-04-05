require 'application_system_test_case'

class LabReportsTest < ApplicationSystemTestCase
  setup do
    @lab_report = lab_reports(:one)
  end

  test 'visiting the index' do
    visit lab_reports_url
    assert_selector 'h2', text: 'Lab Reports'
  end

  test 'creating a Lab report' do
    visit lab_reports_url
    click_on 'Add report'

    fill_in 'Description', with: @lab_report.description
    fill_in 'Title', with: @lab_report.title
    click_on 'Save'

    assert_text 'Lab report was successfully created'
    click_on 'Back'
  end

  test 'updating a Lab report' do
    visit lab_reports_url
    click_on 'Add mark', match: :first

    fill_in 'Grade', with: @lab_report.grade
    click_on 'Save'

    assert_text 'Lab report was successfully updated'
    click_on 'Ok'
  end

  test 'destroying a Lab report' do
    visit lab_reports_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Lab report was successfully destroyed'
  end
end
