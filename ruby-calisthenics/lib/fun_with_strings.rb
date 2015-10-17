module FunWithStrings
  def palindrome?
    _s = self.gsub(/\W/,'').downcase
    if(_s.reverse.eql?(_s))
      return true
    else
      return false
    end 
  end
  def count_words
    _count = Hash.new(0)
    self.downcase.gsub(/(\w+)/){
      |_s|
      _count[_s] += 1
    }
    return _count
  end
  def anagram_groups
    _hash = Hash.new
    self.gsub(/(\w+)/){
      |_s|
      sortedWord = _s.split("").sort.join
      if(_hash[sortedWord]==nil)
        _hash[sortedWord] = [_s]
      else
        _hash[sortedWord] << _s
      end
    }
    _result = []
    _hash.each_value{
      |_group|
      _result << _group
    }
    return _result
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
