
feature "see links" do
  scenario "I want to see a list of my saved links" do
    visit "/links"
    expect(page).to have_content("www.bbc.co.uk")
  end
end
