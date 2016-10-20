def enter_new_link(title, tag)
  visit('/links/new')

  fill_in :title , with: title
  fill_in :url , with: "www.example.com"
  fill_in :tags , with: tag
  click_button('Create Link')

end
