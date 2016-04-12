require 'rails_helper'
RSpec.feature "delete cardio exercise" do


  let(:tracker){create(:tracker)}
  let(:cardio_exercise){create(:cardio_exercise, tracker: tracker)}



  scenario "allow user to delete cardio exercise from workout tracker",  js: true do

    visit tracker_path(tracker, cardio_exercise)



    expect(page).to have_content "Treadmill"

    find("i.fa-times").click


    page.accept_alert
    

    expect(page).to have_content Date.today
    expect(page).to have_content "The cardio exercise has been deleted"
    

  end
end
