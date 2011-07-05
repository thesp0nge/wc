require 'wc/reader'

module Wc
  class Engine
    def initialize(options={})
      
    end

    def self.read_from_file(filename)
      Array(Wc::Reader.read(filename)).sort { |one, two| -(one[1] <=> two[1]) }
    end

    def self.read_inline(a_text)
      Array(Wc::Reader.consume(a_text)).sort { |one, two| -(one[1] <=> two[1]) }
    end

  end
end
