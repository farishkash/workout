require 'rails_helper'
RSpec.feature "edit cardio exercise" do

	
    let(:tracker){create(:tracker)}
    let(:cardio_exercise){create(:cardio_exercise, tracker: tracker)}



	scenario "allow user to edit cardio exercise from workout tracker",  js: true do

	visit tracker_path(tracker, cardio_exercise)

	
	
	expect(page).to have_content "Treadmill"

	find("i.fa.fa-pencil-square-o").click

	
	fill_in "Exercise Name", with: "Bicycle"
    fill_in "Length in Minutes", with: 30
    fill_in "Calories Burned", with: 100

    click_button "Update Exercise"

    expect(page).to have_content Date.today
    expect(page).to have_content "The exercise has been updated"
    expect(page).to have_content "Bicycle"
    expect(page).to have_content 30
    expect(page).to have_content 100


  end
end