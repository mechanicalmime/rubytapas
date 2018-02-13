CommandResult = Struct.new(:status, :output)

class Shell
	def self.execute(command, flags=[], input=nil)
		result = CommandResult.new
		IO.popen([command, *flags], 'w+', err: [:child, :out]) do |io|
	      	io.write(input) if input
	      	io.close_write
	      	result.output = io.read
    	end	
    	result.status = $?
    	result
    end
end

def at(timespec, what)
	Shell.execute("at", [timespec], what)
	if block_given?
    	yield result.output.match(/\Ajob (\d+)/)[1].to_i
  	end
end

def atq
	Shell.execute('atq').output
end

require 'rspec/autorun'

describe '#at' do
	it "executes `at` with the given time and command" do
		Shell.should_receive(:execute).
			with("at", ["now + 3 minutes"], "espeak 'tea is ready!'")
		at("now + 3 minutes", "espeak 'tea is ready!'")
	end

	it "yields the job ID of the scheduled job" do
	    result = double(output: "job 42 at Sun Oct 14 20:15:00 2012")
	    Shell.stub(execute: result)
	    job_id = nil
	    at("some time", "some job") do |id| job_id = id end
	    job_id.should eq(42)
  	end
end

describe "#atq" do
  it "executes returns the output of `atq`" do
    result = double(output: "THE OUTPUT")
    Shell.stub(execute: result)
    atq.should eq("THE OUTPUT")
  end
end