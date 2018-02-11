class Point
	def self.my_new(*args, &block)
		instance = allocate
		instance.my_initialize(*args, &block)
		instance
	end

	def self.new_cartesian(x, y)
	end

	def self.new_polar(distance, angle)
	end

	def my_initialize(x, y)
		@x = x
		@y = y
	end
end


point = Point.my_new(4, 5)
puts point


class Snowflake
	class << self
		private :new
	end

	def self.instance
		@instance ||= new
	end
end

#Singleton behavior by opening up the class and privatizing :new method
