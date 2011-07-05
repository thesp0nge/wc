require 'wc/engine'

class String

  def wc
    self.occurrences.size
  end

  def occurrences
    Wc::Engine.read_inline(self)
  end

  def to_tag_cloud(max_words = nil)

    sorted = self.occurrences

    if max_words.nil?
      cloud_items = sorted
    else
      cloud_items = sorted[0..max_words-1]
    end

    max = sorted.first[1]
    min = sorted.last[1]
    
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
  
end
