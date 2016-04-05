require 'rails_helper'

RSpec.feature "user can add workout" do
	

	scenario "user adds work out on index page",  js: true do 

	visit '/'

	click_on "Add Workout"

	expect(page).to have_content(Date.today)

	




end



end