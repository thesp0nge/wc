require 'spec_helper'

describe 'Wc' do
  it 'should parse a simple string' do
    "This is a test".wc.should be_equal 2
  end
  it 'should tell aword is repeated 3 times' do
    "aword aword aword".occurrences[0][1].should be_equal 3
  end
end
