require 'spec_helper'

feature 'Create Link' do
	scenario 'creates a new link to add to database' do

		visit('/links/new')

    fill_in :title , with: "Bbc"
    fill_in :url , with: "www.bbc.co.uk"
    click_button('Create Link')

    visit('/links')
		expect(page).to have_content('Bbc')
	end
end
