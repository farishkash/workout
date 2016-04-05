

require 'rails_helper'
RSpec.feature "adding cardio exercise"  do 
     before(:each) do
          @tracker = create(:tracker)
     end

	scenario "allow user to add cardio exercise" do

     # get :trackers, tracker_id: 1

     visit new_tracker_cardio_exercise_path(@tracker)

     fill_in "Exercise Name", with: "Treadmill"
     fill_in "Length in Minutes", with: 50
     fill_in "Calories Burned", with: 200

     click_on "Add Exercise"

     expect(page).to have_content Date.today
     expect(page).to have_content "The exercise has been added"
     expect(page).to have_content "Treadmill"
     expect(page).to have_content 50
     expect(page).to have_content 200

 end
end
