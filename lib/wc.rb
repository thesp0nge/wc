class Wc 
  attr_reader :filename, :occurrences
  
  def initialize(filename)
    @filename = filename
    @occurrences = read
    @sorted = Array(occurrences).sort { |one, two| -(one[1] <=> two[1]) }
    
  end
  
  def to_text
      @sorted.each { |elem|
        puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
      }
  end
  
  def to_json
    @sorted.to_json
  end
  
  private
  
  def read() 
    occurrences = Hash.new { |h, k| h[k] = 0 }
    File.open(@filename, "r") { |f|
          f.each_line { |line|
            words = line.split
            words.each { |w| occurrences[w] += 1 }
          }
        }
    occurrences
  end
  
end