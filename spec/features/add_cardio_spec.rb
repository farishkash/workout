require 'rails_helper'
RSpec.feature "adding cardio exercise"  do 

	scenario "allow user to add cardio exercise" do

     visit new_tracker_cardio_exercise_path

     fill_in "Exercise Name", with: "Treadmill"
     fill_in "Length in Minutes", with: 50
     fill_in "Calories Burned", with: 200

     click_on "Add Exercise"

     expect(page).to have_content "The exercise has been added"
     expect(page).to have_content "Treadmill"
     expect(page).to have_content 50
     expect(page).to have_content 200

 end
end
