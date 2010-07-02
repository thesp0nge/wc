class Wc 
  attr_reader :filename, :occurrences, :words
  attr_accessor :hide_list
  
  def initialize(filename, words, hide_list)
    @filename = filename
    @hide_list = hide_list
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
  
  def to_cloud
    if @words == -1
      cloud_items = @sorted
    else
      cloud_item = @sorted[0..@words-1]
    end
    ret = "<dl>"
    i=1
    cloud_item.each { |elem|
      ret+="<dt id=\"a"+i.to_s+"\">" + elem[0] +"</dt>"
      i+=1
    }
    ret += "</dl>"
    ret
  end
  
  private
  
  def read() 
    occurrences = Hash.new { |h, k| h[k] = 0 }
    File.open(@filename, "r") { |f|
          f.each_line { |line|
            words = line.split
            words.each { |w|
              if ! hide_list.include?(w.downcase)
                occurrences[w.downcase] += 1 
              end
            }
          }
        }
    occurrences
  end
  
  
  
end