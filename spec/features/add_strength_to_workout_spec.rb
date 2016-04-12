require 'rails_helper'

RSpec.feature "add strength exercise to workout" do
  let(:tracker){create(:tracker)}

  scenario "allow user to add strength exercise to workout page",  js: true do
    visit tracker_path(tracker)

    click_on "Add Strength Exercise"

    fill_in "Exercise Name", with: "Bench Press"
    fill_in "Sets", with: 3
    fill_in "Reps", with: 5
    fill_in "Weight", with: 100

    sleep(inspection_time=5)

    click_on "Save"

    sleep(inspection_time=5)

    expect(page).to have_content Date.today
    expect(page).to have_content "The strength exercise has been added"
    expect(page).to have_content "Bench Press"
    expect(page).to have_content 3
    expect(page).to have_content 5
    expect(page).to have_content 100

  end
end
