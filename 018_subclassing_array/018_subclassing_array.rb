#If inheriting from a core class, funky things can happen, like using the +, since it's implemented in C, it always returns Array, not the subclass
#to enable a class for enumerable, it suffices to implement each, since all methods rely on it


class TagList
	include Enumerable 

	def initialize(*args)
		@list = Array.new(*args)
	end

	def <<(tag)
		tag.to_s.strip.split.each do |t|
			@list << t
		end
		self
	end

	def to_s
		list.join(" ")
	end

	def +(other)
		self.class.new(list + other.list)
	end

	def each(*args, &block)
    	list.each(*args, &block)
  	end

	protected

	attr_reader :list
end

tl1 = TagList.new(%w[apple peach])
tl2 = TagList.new(%w[pear banana])
puts tl1 + tl2

tl3 = TagList.new(%w[apple peach pear banana])
puts tl3.grep(/p/) # => ["apple", "peach", "pear"]
puts tl3.map(&:reverse) # => ["elppa", "hcaep", "raep", "ananab"]
puts tl3.group_by(&:size)
