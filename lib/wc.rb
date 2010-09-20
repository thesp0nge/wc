class Wc 
  attr_reader :filename, :occurrences, :words, :no_autorun, :css, :css_mode
  attr_accessor :hide_list
  
  # Creates a new Wc object
  # 
  # The filename is no mandatory, but if provided it will be used to feed thw
  # word counter gem, otherwise standard input is used.
  # Options is an array customizing the gem's behavior further.
  # 
  
  def initialize(filename=nil, options={})
    @hide_list = options["hide_list"]
    @words = options["words"]
    @no_autorun = options["no_autorun"]
    
    @css_mode = options["css_mode"]
    
    if ! @hide_list
      @hide_list = []
    end
  
    if ! @no_autorun 
      warn "[DEPRECATION]: 'no_autorun' option will be deprecated in wc 1.0.0 and the default behavior will be no_autorun=TRUE"
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
  
#  def to_json
#    if @words == -1
#      return @sorted.to_json
#    else
#      return @sorted[0..@words-1].to_json
#    end
#  end
  
  def to_cloud
    if @words == -1
      cloud_items = @sorted
    else
      cloud_items = @sorted[0..@words-1]
    end
    max = @sorted.first[1]
    min = @sorted.last[1]
    
    range = max - min
    interval = (1.0 * range)/10
    
    r0=min+interval
    r1=r0+interval
    r2=r1+interval
    r3=r2+interval
    r4=r3+interval
    r5=r4+interval
    r6=r5+interval
    r7=r6+interval
    r8=r7+interval
    r9=r8+interval
    r10=r9+interval
    
    ret = "<ul id=\"cloud\">"
    
    cloud_items.each { |elem|
      if (elem[1]>r10)
        c="tag9"
      elsif (elem[1] > r9)
        c="tag8"
      elsif (elem[1] > r8)
        c="tag7"
      elsif (elem[1] > r7)
        c="tag6"
      elsif (elem[1] > r6)
        c="tag5"
      elsif (elem[1] > r5)
        c="tag4"
      elsif (elem[1] > r4)
        c="tag3"
      elsif (elem[1] > r3)
        c="tag2"
      elsif (elem[1] > r2)
        c="tag1"
      else
        c="tag0"
      end
    
      ret+="<li><a href=\"#\" class=\""+c+"\">" + elem[0] +"</a></li>"
      
    }
    ret += "</ul>"
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
    if @words == -1
      c = @sorted
    else
      c = @sorted[0..@words-1]
    end
    @sorted = c
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