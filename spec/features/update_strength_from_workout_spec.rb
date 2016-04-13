require 'rails_helper'

RSpec.feature "add strength exercise to workout" do
  let(:tracker){create(:tracker)}
  let(:strength_exercise){create(:strength_exercise, tracker: tracker)}

  scenario "allow user to add strength exercise to workout page",  js: true do
    visit tracker_path(tracker, strength_exercise)

    expect(page).to have_content "Bench Press"

    find("i.fa.fa-pencil-square-o").click

    fill_in "Exercise Name", with: "Overhead Press"
    fill_in "Sets", with: 3
    fill_in "Reps", with: 5
    fill_in "Weight", with: 75

    sleep(inspection_time=5)

    click_button "Update Exercise"

    sleep(inspection_time=5)

    expect(page).to have_content Date.today
    expect(page).to have_content "The strength exercise has been updated"
    expect(page).to have_content "Overhead Press"
    sleep(inspection_time=5)
    expect(page).to have_content 3
    expect(page).to have_content 5
    expect(page).to have_content 75

  end
end
