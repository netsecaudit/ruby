filename = ARGV[0]
     key = ARGV[1]
     num = 1
if filename==nil||key==nil
  puts "usage: grep [filepath] [keyword]"
  exit
end
file=File.open(filename)
file.each_line do |line|
  if /#{key.downcase}/ =~ line
    print "line:",num," "
    line.split.each do |word|
     if key.downcase==word
        print "\033[45m #{word} \033[0m "
      else
        print word," "
    end
    end
    print "\n"
  else
  if /#{key.upcase}/ =~ line
    print "line:",num," "
    line.split.each do |word|
      if key.upcase==word
        print "\033[45m #{word} \033[0m "
      else
        print word," "
      end
    end
    print "\n"
  end
  end
  num=num+1
end
file.close