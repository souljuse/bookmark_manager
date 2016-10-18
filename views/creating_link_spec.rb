require 'spec_helper'

feature 'Display Link' do
	scenario 'visiting the homepage' do
		visit('/links/new')

    fill_in(:title), with: "Bbc"
    fill_in(:url), with: "www.bbc.co.uk"
    click_button("Create Link")

		within 'ul#links' do
			expect(page).to have_content('Bbc')
		end
	end
end
