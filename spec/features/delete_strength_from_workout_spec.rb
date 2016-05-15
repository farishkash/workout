require 'rails_helper'
RSpec.feature "delete strength exercise" do


  let(:tracker){create(:tracker)}
  let(:strength_exercise){create(:strength_exercise, tracker: tracker)}



  scenario "allow user to delete strength exercise from workout tracker",  js: true do

    visit tracker_path(tracker, strength_exercise)



    expect(page).to have_content "Bench Press"

    find("i.fa-times").click


    page.accept_alert
    

    expect(page).to have_content Date.today
    expect(page).to have_content "The strength exercise has been deleted"
    

  end
end
