module Wc
  class Reader
    HIDE_LIST = ['or', 'the', 'of', 'a', 'if', 'to', 'and', 'in', 'is', 'are']

    def self.read(filename, hide_list=nil) 
      occurrences = Hash.new { |h, k| h[k] = 0 }

      File.open(filename, "r") { |f|
        f.each_line { |line|
          Wc::Reader.consume(line)
        }
      }
      occurrences
    end

    def self.consume(a_text)
      occurrences = Hash.new { |h, k| h[k] = 0 }

      words = a_text.split
      words.each { |w|
        if ! HIDE_LIST.include?(w.downcase)
          occurrences[w.downcase] += 1 
        end
      }
      occurrences
    end
  end
end
