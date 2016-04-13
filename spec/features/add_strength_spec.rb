require 'rails_helper'

RSpec.feature "adding strength exercise"  do 
 before(:each) do
          @tracker = create(:tracker)
     end

	scenario "allow user to add strength exercise" do

     # get :trackers, tracker_id: 1

     visit new_tracker_strength_exercise_path(@tracker)

     fill_in "Exercise Name", with: "Bench Press"
     fill_in "Sets", with: 3
     fill_in "Reps", with: 5

     click_on "Add Exercise"

     expect(page).to have_content Date.today
     expect(page).to have_content "The strength exercise has been added"
     expect(page).to have_content "Bench Press"
     expect(page).to have_content 3
     expect(page).to have_content 5

 end
end