require 'spec_helper'

feature 'Create Link' do
	scenario 'creates a new link to add to database' do
		enter_new_link
		link = Link.first
    expect(link.tags.map(&:name)).to include('news')
	end
end
