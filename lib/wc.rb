class Wc 
  attr :filename
  
  def initialize(filename)
    @filename = filename
    @hash = read
    Array(hash).sort { |one, two| -(one <=> two) }
    
  end
  
  def to_text
      @hash.each { |elem|
        puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
      }
  end
  
  private
  
  def read() 
    hash = Hash.new { |h, k| h[k] = 0 }
    File.open(ARGV[0], "r") { |f|
          f.each_line { |line|
            words = line.split
            words.each { |w| hash[w] += 1 }
          }
        }
    hash
  end
  
end