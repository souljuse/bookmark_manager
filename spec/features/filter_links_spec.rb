require 'spec_helper'

feature 'Filter links' do
	scenario 'filter links in a single page' do
		enter_new_link("Bbc", "news")
    enter_new_link("Corriere", "news")
    enter_new_link("Prince Charles", "not_news")

		visit('/tags/news')
    expect(page.status_code).to eq(200)

    within 'ul#links' do
			expect(page).to have_content('Bbc')
		end
	end
end
