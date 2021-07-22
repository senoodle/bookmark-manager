feature 'Delete a bookmark' do
  scenario 'user can delete a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers academy')

    visit('/bookmarks')

    expect(page).to have_link('makers academy', href: 'http://www.makersacademy.com')

    # using capybaras first method to click button inside the first element with the class 'bookmark'
    first('.bookmark').click_button 'Delete'

    # expect(current_path).to eq '/bookmarks'
    expect(page).to have_current_path('/bookmarks')
    expect(page).not_to have_link('makers academy', href: 'http://www.makersacademy.com')
  end
end
