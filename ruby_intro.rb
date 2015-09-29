# When done, submit this entire file.

# My student ID is 201528015029031

# tool method
def sort2 (a,b)
  if a > b
    return a,b
  else
    return b,a
  end
end

# Part 1

def sum arr
  sum=0
  arr.each do |i|
    sum+=i
  end
  return sum
end

def max_2_sum arr
  if arr.size == 0
    return 0
  elsif arr.size == 1
    return arr[0]
  else
    max1,max2 = sort2 arr[0],arr[1]
    i = 2
    while i < arr.size
      x = arr[i]
      if x > max1
        max2 = max1
        max1 = x
      elsif x > max2
        max2 = x
      end
      i+=1
    end
    return max1 + max2
  end
end

def sum_to_n? arr, n
  if arr.size < 2
    return false
  end

  arr.sort!
  i,j = 0,arr.size-1
  while i<j
    sum_tmp = arr[i] + arr[j]
    if sum_tmp == n
      return true
    elsif sum_tmp < n
      i+=1
    else
      j-=1
    end    
  end
  return false

  # The time complexity of the method above is O(nlogn)+O(n)
  # And the simple method below takes O(n*n)

  # i=0
  # while i < arr.size
  #   j=i+1
  #   while j < arr.size
  #     if arr[i]+arr[j] == n
  #       return true
  #     end
  #     j+=1
  #   end
  #   i+=1
  # end
  # return false
end

# Part 2

def hello(name)
  return "Hello, #{name}"
end

def starts_with_consonant? s
  if s == nil or s == ""
    return false
  end
  if s[0].capitalize < "A" or s[0].capitalize > "Z"
    return false
  end
  h = Array["A","E","I","O","U"]
  if h.index(s[0].capitalize) == nil
    return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  if s == nil or s.size == 0
    return false
  end
  if s == "0"
    return true
  end
  i = 0
  while i < s.size
    if s[i] != "0" and s[i] != "1"
      return false
    end
    i+=1
  end
  if s[-1] != "0" or s[-2] != "0"
    return false
  else
    return true
  end
end

# Part 3

class BookInStock
  String @isbn = ""
  Float @price = 0
  def initialize(isbn,price)
    raise ArgumentError,"ArgumentError" if isbn == "" or price <= 0
    @isbn,@price = isbn,price
  end

  def isbn
    @isbn
  end

  def isbn=(isbn)
    @isbn = isbn
  end

  def price
    @price
  end

  def price=(price)
    @price = price
  end

  def price_as_string
    p = (@price * 100).round
    res = (p%10).to_s
    p = p/10
    res = (p%10).to_s + res
    p= p/10
    "$" + p.to_s + "." + res
  end
end

