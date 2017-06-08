filename = ARGV[0]
file = File.open(filename)
test = file.each_line do |line| puts line end
file.close

