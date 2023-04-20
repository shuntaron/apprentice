def sum(x, y)
  sum = 0

  x.upto y do |i|
    sum += i
  end

  puts sum
end

sum(10, 80)
