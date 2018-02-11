#Methods are not first class objects in Ruby, becasue of Smalltalk
#Methods are concrete implementations of how an object might respond to a message

class TeaClock
	attr_accessor :ui
	attr_accessor :timer

	def initialize(minutes)
		self.ui = StdioUi.new
		#self.timer = SleepTimer.new(minutes, ui.method(:notify))
		self.timer = SleepTimer.new(minutes, ui)
		init_plugins
	end

	def start
		timer.start
	end

	def init_plugins
		@plugins = []
		::Plugins.constants.each do |name|
			@plugins << ::Plugins.const_get(name).new(self)
		end
	end
end

SleepTimer = Struct.new(:minutes, :notifier) do 
	def start
		sleep minutes * 60
		notifier.notify("Tea is ready!")
		#notifier.call("Tea is ready!")
	end
end

class StdioUi
	def notify(text)
		puts text
	end
end

module Plugins
  class Beep
    def initialize(tea_clock)
      tea_clock.ui.extend(UiWithBeep)
    end

    module UiWithBeep
      def notify(*)
        puts "BEEP!"
        super
      end
    end
  end
end

t = TeaClock.new(0.01).start
