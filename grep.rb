
def openFile()
  filename = ARGV[0]
  key = ARGV[1]
if filename.nil? || key.nil?
  puts "usage: grep [filepath] [keyword]"
  exit
end
end

def grep()
  filename = ARGV[0]
  key = ARGV[1]
  num = 1
file=File.open(filename)
file.each_line do |line|
  if /#{key.upcase}/ =~ line.upcase
    print "Line:",num,"  "
    line.split.each do |word|
      if /#{key.upcase}/ =~ word.upcase
        print "\033[45m #{word} \033[0m "
      else
        print word," "
      end
    end
    print "\n"
  end
num = num+1
end
file.close
end

def main()
  openFile()
  grep()
end

main()