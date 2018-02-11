module YeOlde
  def hello(subject="World")
    if defined?(super)
      super
    else
      puts "Good morrow, #{subject}!"
    end
    puts "Well met indeed!"
  end
end

class Greeter
  def hello(subject)
    puts "Hello, #{subject}"
  end
end

class GreeterChild < Greeter
  include YeOlde
end

class NonGreeter
  include YeOlde
end

GreeterChild.new.hello("Bob")
NonGreeter.new.hello("Sally")