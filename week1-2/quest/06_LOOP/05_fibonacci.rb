def fibonacci(n)
  a, b = 0, 1
  n.times do
    a, b = b, a + b
  end
  puts a
end

fibonacci(0)
fibonacci(1)
fibonacci(2)
fibonacci(3)
fibonacci(4)
fibonacci(7)
fibonacci(30)
