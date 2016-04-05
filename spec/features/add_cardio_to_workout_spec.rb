require 'rails_helper'

RSpec.feature "user can add cardio exercise to tracker" do

	 let(:tracker){create(:tracker)}
    #let(:cardio_exercise){create(:cardio_exercise, tracker: tracker)}

  scenario "allow user to add cardio exercise to workout page",  js: true do 


   
     visit tracker_path(tracker)

     click_on "Add Cardio Exercise"
	 fill_in "Exercise Name", with: "Treadmill"
     fill_in "Length in Minutes", with: 50
     fill_in "Calories Burned", with: 200

     click_on "Save"

     expect(page).to have_content "Treadmill"


  end
end