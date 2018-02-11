system "ln -s file1 file 2" #calls the shell to interpret single string

system "ln", "-s", "file1 file 2" #calls the system directly

command = ["ln"]
options = ["-s"]
arguments = ["file1 file2"]

system *(command + options + arguments) #splat operator converts array to method params

# %W enables interpolation, uses double quotes
# %w uses single quotes, cant use interpolation