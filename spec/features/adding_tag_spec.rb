require 'spec_helper'

feature 'Add tags' do
	scenario 'add multiple tags to a link' do
		enter_new_link("Funny Cats", "fun cats")
		link = Link.first
    expect(link.tags.map(&:name)).to include('fun', 'cats')
	end
end
