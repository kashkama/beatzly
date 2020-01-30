class Person
	attr_reader :id
	attr_accessor :name, :age

	@@people = {}
	@@total = 0

	def initialize(attributes)
		@name = attributes.fetch(:name)
		@age = attributes.fetch(:age)
		@id = attributes.fetch(:id) || @@total += 1
	end

	def delete
		@@people.delete(self.id);
		@@people
	end

	def save
		@@people[self.id] = Person.new({:name => self.name, :age => self.age, :id => self.id})
		@@people
	end

	def ==(person_to_compare)
		self.name.eql?(person_to_compare.name)
	end

	def self.find(id) 
		@@people[id]
	end
end

# can get the instance of tut using the id
# verify that once we instantiate and save Person we increment id twice

person = Person.new({:name => 'wes', :age => 34, :id => nil})
person.save
person2 = Person.new({:name => 'jack', :age => 23, :id => nil})
person.save
find_person = Person.find(nil);
puts "find person #{find_person}"