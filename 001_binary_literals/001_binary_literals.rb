0xDEADBEEF #hex
0755 #octal

require 'fileutils'
include FileUtils

#chmod 0755, 'somefile'

# U G O
# rwxrwxrwx
0b110100100

perms = 0b110100100
puts perms.to_s(8)

#chmod perms, 'somefile'
