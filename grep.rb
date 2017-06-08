filename = ARGV[0]
     key = ARGV[1]
if filename==nil||key==nil
  puts "usage: grep [filepath] [keyword]"
  exit
end
file=File.open(filename)
file.each_line do |line|
  if /#{key.upcase}/ =~ line
    puts line
  else
    if /#{key.downcase}/ =~ line
    puts line
    end
  end
end
file.close