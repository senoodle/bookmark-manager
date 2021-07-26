require 'bookmark'
require 'database_helpers'

describe Bookmark do

  let(:bookmarks) { ["http://www.makersacademy.com", "http://www.destroyallsoftware.com", "http://www.google.com"] }

  describe '.all' do
    it 'returns the list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    #--------old---------
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    #--------new---------
    # using makers academy out of all bookmarks as our test 
    bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "makers academy")
    
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "destroy all software")
    Bookmark.create(url: "http://www.google.com", title: "google")
      
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3 # 3 bookmarks
      expect(bookmarks.first).to be_a Bookmark # an instance of Bookmark
      expect(bookmarks.first.id).to eq bookmark.id # id for makers academy since it is first on the list
      expect(bookmarks.first.title).to eq "makers academy"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.create' do

    it 'should create a new bookmark' do
      # improving test so that .create returns new Bookmark object and checks those values instead of calling Bookmark.all
      bookmark = Bookmark.create(url: 'http://www.youtube.com', title: 'youtube')
      # refactoring test to extract persisted_data => database_helpers.rb
      # persisted_data = connection.query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'youtube'
      expect(bookmark.url).to eq 'http://www.youtube.com'
    end

    it 'does not create a new bookmark if the URL is not valid' do
      bookmark = Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(bookmark).not_to be_a Bookmark
    end
    
  end

  describe '.delete' do

    it 'should delete the bookmark' do
      bookmark = Bookmark.create(title: 'makers academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do

    it 'should update the bookmark' do
      bookmark = Bookmark.create(title: 'makers academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, title: 'makers academy 1', url: 'http://www.makersacademy1.com')

      expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'makers academy 1'
    expect(updated_bookmark.url).to eq 'http://www.makersacademy1.com'
    end
  end


  describe '.find' do
    it 'should find the requested bookmark' do
      bookmark = Bookmark.create(title: 'makers academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'makers academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

end