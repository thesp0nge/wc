class Wc 
  attr :filename
  
  def initialize(filename)
    @filename = filename
    @hash = read
    @hash.sort{|a,b| a[1]<=>b[1]}
  end
  
  def to_text
    @hash.each { |elem|
      puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
    }
  end
  
  private
  
  def read() 
    hash = Hash.new
    f = File.open(ARGV[0], "r")
    f.each_line { |line|
      words = line.split
      words.each { |w|
        if hash.has_key?(w)
          hash[w] = hash[w] + 1
        else
          hash[w] = 1
        end
      }
    }
    hash
  end
  
end