def square(numbers)
  numbers.map do |number|
    number * number
  end
end

square_numbers = square([5, 7, 10])
print square_numbers
