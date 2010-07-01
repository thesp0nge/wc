class Wc 
  attr_reader :filename, :occurrences, :words
  
  def initialize(filename, words)
    @filename = filename
    @occurrences = read
    @sorted = Array(occurrences).sort { |one, two| -(one[1] <=> two[1]) }
    @words = words
  end
  
  def to_text
    if @words == -1
      @sorted.each { |elem|
        puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
      }
    else 
      @sorted[0..@words-1].each { |elem|
        puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
      }
    end
  end
  
  def to_json
    if @words == -1
      return @sorted.to_json
    else
      return @sorted[0..@words-1].to_json
    end
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