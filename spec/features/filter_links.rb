require 'spec_helper'

feature 'Create Link' do
	scenario 'creates a new link to add to database' do
		enter_new_link("Bbc", "news")
    enter_new_link("Corriere", "news")
    enter_new_link("Prince Charles", "not_news")

		visit('/tags/news')
    expect(page.status_code).to eq(200)
    within 'ul#links' do
			expect(page).to have_content('Bbc')
			expect(page).to have_content('Corriere')
		end
	end
end
