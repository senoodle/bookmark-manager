require 'bookmark'

describe Bookmark do
  let(:bookmarks) { ["http://www.makersacademy.com", "http://www.bbc.com", "http://www.google.com"] }
  describe '.all' do
    it 'returns the list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.create' do
    it 'should create a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create(url: "http://www.youtube.com")

      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.youtube.com"
    end
  end
end