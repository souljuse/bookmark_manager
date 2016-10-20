require 'spec_helper'

feature 'Create Link' do
	scenario 'creates a new link to add to database' do
		enter_new_link("Bbc", 'news')
	  visit('/links')
	  expect(page).to have_content('Bbc')
	end
end
