require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an album path', {:type => :feature}) do
	it('creates an album and then goes to album page') do
		visit('/albums')
		click_on('Add new album')
		fill_in('album_name', :with => 'Yellow Submarine')
		click_on('add')
		visit('/albums')
		expect(page).to have_content('Yellow Submarine')
	end
end

describe('create a song path', {:type => :feature}) do
	it('creates an album and then goes to the album page') do
		album = Album.new({:name =>'Yellow Submarine', :id => nil})
		album.save
		visit("/albums/#{album.id}")
		fill_in('song_name', :with => 'All You Need is Love')
		click_on('add song')
		expect(page).to have_content('All You Need is Love')
	end
end