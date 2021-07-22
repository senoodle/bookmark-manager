feature 'Add new bookmark' do
  scenario 'check Add New Bookmark' do
    visit('/bookmarks')

    find_link('Add New Bookmark').visible?
  end

  scenario 'add new bookmark' do
    visit('/bookmarks/add')

    fill_in('url', with: 'http://www.youtube.com')
    fill_in('title', with: 'youtube')

    click_button('Submit')

    expect(page).to have_link('youtube', href: 'http://www.youtube.com')
  end

end
