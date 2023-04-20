def train_fare(age)
  case age
  when 0..5
    p 0
  when 6..11
    puts "100"
  else
    print "200\n"
  end
end

train_fare(12)
train_fare(6)
train_fare(5)
