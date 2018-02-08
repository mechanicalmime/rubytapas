chefs = %w(Sam Rob Noel)
topics = %w(core ideas tests)

matrix = [0b110, 0b100, 0b001]
#instead of matrix = [[true, true, false], [true, false, false], [false, false, true]]

class Guests
	def initialize(chefs, topics, matrix)
		@chefs = chefs.map.with_index.to_h
		@topics = topics.map.with_index.to_h
		@matrix = matrix
	end

	def covered?(chef, topic)
		row = @chefs.fetch(chef)
		col = @topics.fetch(topic)
		@matrix[row][col] == 1
	end
end

guests = Guests.new(chefs, topics.reverse, matrix) #reverse is needed because [] on binary literals operates from right to left
puts guests.covered?('Sam', 'core')
puts guests.covered?('Rob', 'tests')