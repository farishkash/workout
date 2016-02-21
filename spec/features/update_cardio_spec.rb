require 'rails_helper'
RSpec.feature "edit cardio exercise" do

	before :each do
		@exercise = create(:cardio_exercise)
	end



	scenario "allow user to edit exercise" do

	visit cardio_exercise_path(@exercise)

	
	
	expect(page).to have_content "Treadmill"

	click_on "Edit Exercise"

	
	fill_in "Exercise Name", with: "Bicycle"
    fill_in "Length in Minutes", with: 30
    fill_in "Calories Burned", with: 100

    click_button "Update Exercise"

    expect(page).to have_content "The exercise has been updated"
    expect(page).to have_content "Bicycle"
    expect(page).to have_content 30
    expect(page).to have_content 100


  end
end