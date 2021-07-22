feature 'Update a bookmark' do
  scenario 'user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers academy')

    visit('/bookmarks')

    expect(page).to have_link('makers academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Update'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

    fill_in('url', with: 'http://www.makersacademy1.com')
    fill_in('title', with: 'makers academy 1')

    click_button('Submit')

    expect(page).to have_current_path('/bookmarks')
    expect(page).not_to have_link('makers academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('makers academy 1', href: 'http://www.makersacademy1.com')
  end
end