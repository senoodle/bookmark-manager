feature "Viewing bookmarks" do
  scenario 'viewing bookmarks' do
    
    Bookmark.create(url:'http://www.makersacademy.com', title: 'makers academy')
    Bookmark.create(url:'http://www.destroyallsoftware.com', title: 'destroy all software')
    Bookmark.create(url:'http://www.google.com', title: 'google')
    
    visit "/bookmarks"

    expect(page).to have_link('makers academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('destroy all software', href: "http://www.destroyallsoftware.com")
    expect(page).to have_link('google', href: "http://www.google.com")
  end
end

