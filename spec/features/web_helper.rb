def enter_new_link(title, tag)
  visit('/links/new')

  fill_in :title , with: title
  fill_in :url , with: "www.example.com"
  fill_in :tags , with: tag
  click_button('Create Link')

end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  click_button 'Sign up'
end
