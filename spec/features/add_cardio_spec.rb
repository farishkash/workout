

require 'rails_helper'
RSpec.feature "adding cardio exercise"  do 
     before(:each) do
          @tracker = create(:tracker)
     end

	scenario "allow user to add cardio exercise", js: true do 

     # get :trackers, tracker_id: 1

     visit new_tracker_cardio_exercise_path(@tracker)

     click_on "Add Cardio Exercise"

     fill_in "Exercise Name", with: "Treadmill"
     fill_in "Length in Minutes", with: 50
     fill_in "Calories Burned", with: 200

     click_on "Save"

     expect(page).to have_content Date.today
     expect(page).to have_content "The exercise has been added"
     expect(page).to have_content "Treadmill"
     

 end
end
