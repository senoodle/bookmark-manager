feature 'Add new bookmark' do
  scenario 'check Add New Bookmark' do
    visit('/bookmarks')

    find_link('Add New Bookmark').visible?
  end

  scenario 'add new bookmark' do
    visit('/bookmarks/add')

    fill_in('url', with: 'http://www.youtube.com')

    click_button('Submit')

    expect(page).to have_content "http://www.youtube.com"
  end

end
