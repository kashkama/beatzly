require("spec_helper")

describe('#Artist') do
	describe('.all') do
		it("returns a list of all artists") do
			artist = Artist.new({:name => "Eminem", :id => nil})
			artist.save
			artist2 = Artist.new({:name => "Akon", :id => nil})
			artist2.save
			expect(Artist.all).to(eq([artist, artist2]))
		end
	end

	describe('#==') do
		it("is the same artist if it has the same attributes as another artist") do
			artist = Artist.new({:name => "Eminem", :id => 1})
			artist2 = Artist.new({:name => "Eminem", :id => 1})
			expect(artist).to(eq(artist2))
		end
	end

	describe('#save') do
		it("saves an artist") do
			artist = Artist.new({:name => "Eminem", :id => nil})
			artist.save
			artist2 = Artist.new({:name => "Akon", :id => nil})
			artist2.save
			expect(Artist.all).to(eq([artist, artist2]))
		end
	end

	describe('.clear') do
		it("clears all artists") do
			artist = Artist.new({:name => "Eminem", :id => nil})
			artist.save
			artist2 = Artist.new({:name => "Akon", :id => nil})
			artist2.save
			Artist.clear
			expect(Artist.all).to(eq([]))
		end
	end

	describe('.find') do
		it("finds an artist by id") do
			artist = Artist.new({:name => "Eminem", :id => nil})
			artist.save
			artist2 = Artist.new({:name => "Akon", :id => nil})
			artist.save
			expect(Artist.find(artist.id)).to(eq(artist))
		end
	end

	describe('#delete') do
		it("delete an artist by id") do
			artist = Artist.new({:name => "Eminem", :id => nil})
			artist.save
			artist2 = Artist.new({:name => "Akon", :id => nil})
			artist2.save
			artist2.delete
			expect(Artist.all).to(eq([artist]))
		end
	end

	describe('#update') do
		it('updates an artist new album, artist name etc') do
			artist = Artist.new({:name => "Eminem", :id => nil})
			artist.save
			album = Album.new({:name => "Kamekazi", :id => nil})
			album.save
			artist.update({:album_name => "Kamekazi"})
			expect(artist.albums).to(eq([album]))
		end
	end
end