puts ?c == "c"
puts ?q == "q"

case $stdin.getc.downcase
when ?y then puts "Proceed"
when ?n then puts "Abort"
else puts "I don't understand"
end
