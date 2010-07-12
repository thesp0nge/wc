class Wc 
  attr_reader :filename, :occurrences, :words, :no_autorun
  attr_accessor :hide_list
  
  # def initialize(filename, words, hide_list)
  
  #  if ! filename.nil?
  #    @filename = filename
  #    @occurrences = read
  #  else
  #    @filename = STDIN
  #    @occurrences = feed
  #  end
    
  #  @hide_list = hide_list
  #  @sorted = Array(occurrences).sort { |one, two| -(one[1] <=> two[1]) }
  #  @words = words
  #end
  
  def initialize(filename=nil, options={})
    @hide_list = options["hide_list"]
    @words = options["words"]
    @no_autorun = options["no_autorun"]
    
    if ! @hide_list
      @hide_list = []
    end
    p @no_autorun
    if ! @no_autorun 
       if filename
        @filename = filename
        @occurrences = _read
      else
        @filename =STDIN
        @occurrences = _feed
      end
      @sorted = Array(occurrences).sort { |one, two| -(one[1] <=> two[1]) }
    end
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
  
  def read(filename) 
    @occurrences = Hash.new { |h, k| h[k] = 0 }
    File.open(filename, "r") { |f|
          f.each_line { |line|
            words = line.split
            words.each { |w|
              if ! hide_list.include?(w.downcase)
                @occurrences[w.downcase] += 1 
              end
            }
          }
        }
    @occurrences
  end
  
  def feed(line)
    @occurrences = Hash.new { |h, k| h[k] = 0 }
    words = line.split
    words.each { |w|
      if ! hide_list.include?(w.downcase)
        @occurrences[w.downcase] += 1 
      end
    }
    @occurrences
  end
  
  def get()
    @sorted = Array(occurrences).sort { |one, two| -(one[1] <=> two[1]) }
  end
  
  private
  
  def _read() 
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
  
  def _feed() 
    occurrences = Hash.new { |h, k| h[k] = 0 }
    filename.each_line { |line|
      words = line.split
      words.each { |w|
        if ! hide_list.include?(w.downcase)
          occurrences[w.downcase] += 1
        end
      }
    }
    occurrences
  end
  
  
  
end