require 'rspec'
require 'pg'
require 'album'
require 'song'
require 'artist'
require 'pry'

DB = PG.connect({:dbname => 'beatzly_store_test'})

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM albums *;")
		DB.exec("DELETE FROM songs *;")
		DB.exec("DELETE FROM artists *;")
		DB.exec("DELETE FROM albums_artists *;")
	end
end